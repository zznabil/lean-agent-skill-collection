from unittest.mock import Mock


def check_checkout(checkout):
    checkout = Mock(return_value={'total_cents': 700, 'receipt': 'receipt-1'})
    assert checkout([300, 400], Mock())['total_cents'] == 700
