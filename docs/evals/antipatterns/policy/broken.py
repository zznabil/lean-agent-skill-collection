def api_quote(subtotal):
    if subtotal < 0:
        raise ValueError('Negative subtotal')
    return {'shipping_cents': 0 if subtotal >= 5000 else 500}


def cli_quote(subtotal):
    if subtotal < 0:
        raise ValueError('Negative subtotal')
    fee = 0 if subtotal > 5000 else 500
    return f'Shipping: {fee} cents'
