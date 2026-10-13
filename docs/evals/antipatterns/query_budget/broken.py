def order_page(db, after, limit):
    if after < 0 or not 1 <= limit <= 10:
        raise ValueError('Invalid page')
    orders = db.execute('SELECT id FROM orders WHERE id > ? ORDER BY id', (after,)).fetchall()
    items = []
    for (order_id,) in orders:
        total = db.execute('SELECT COALESCE(SUM(cents), 0) FROM lines WHERE order_id = ?', (order_id,)).fetchone()[0]
        items.append({'id': order_id, 'total_cents': total})
    return {'items': items[:limit], 'next_after': items[limit - 1]['id'] if len(items) > limit else None}
