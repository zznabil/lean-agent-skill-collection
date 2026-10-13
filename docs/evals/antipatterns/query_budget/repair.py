def order_page(db, after, limit):
    if after < 0 or not 1 <= limit <= 10:
        raise ValueError('Invalid page')
    rows = db.execute('''
        SELECT orders.id, COALESCE(SUM(lines.cents), 0)
        FROM orders LEFT JOIN lines ON lines.order_id = orders.id
        WHERE orders.id > ? GROUP BY orders.id ORDER BY orders.id LIMIT ?
    ''', (after, limit + 1)).fetchall()
    items = [{'id': order_id, 'total_cents': total} for order_id, total in rows[:limit]]
    return {'items': items, 'next_after': items[-1]['id'] if len(rows) > limit else None}
