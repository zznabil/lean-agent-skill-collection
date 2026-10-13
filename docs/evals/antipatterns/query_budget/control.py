def order_page(db, after, limit):
    if after < 0 or not 1 <= limit <= 10:
        raise ValueError('Invalid page')
    rows = db.execute('SELECT id FROM orders WHERE id > ? ORDER BY id LIMIT ?', (after, limit + 1)).fetchall()
    ids = [row[0] for row in rows[:limit]]
    totals = dict.fromkeys(ids, 0)
    if ids:
        slots = ','.join('?' for _ in ids)
        for order_id, cents in db.execute(f'SELECT order_id, cents FROM lines WHERE order_id IN ({slots})', ids):
            totals[order_id] += cents
    items = [{'id': order_id, 'total_cents': totals[order_id]} for order_id in ids]
    return {'items': items, 'next_after': ids[-1] if len(rows) > limit else None}
