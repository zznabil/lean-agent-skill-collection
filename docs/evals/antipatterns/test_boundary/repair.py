def check_checkout(checkout):
    class Gateway:
        def __init__(self):
            self.charges = []

        def charge(self, cents):
            self.charges.append(cents)
            return 'receipt-1'

    gateway = Gateway()
    result = checkout([300, 400], gateway)
    assert result == {'total_cents': 700, 'receipt': 'receipt-1'}
    assert gateway.charges == [700]
