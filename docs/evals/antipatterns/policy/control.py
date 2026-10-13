def shipping_cents(subtotal):
    if subtotal < 0:
        raise ValueError('Negative subtotal')
    return 0 if subtotal >= 5000 else 500


def api_quote(subtotal):
    # Output formats belong to their adapters.
    return {'shipping_cents': shipping_cents(subtotal)}


def cli_quote(subtotal):
    fee = shipping_cents(subtotal)
    return 'Shipping: {} cents'.format(fee)
