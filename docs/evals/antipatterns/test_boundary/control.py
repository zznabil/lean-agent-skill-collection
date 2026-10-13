from unittest.mock import Mock


def check_checkout(checkout):
    gateway = Mock()
    gateway.charge.return_value = 'receipt-1'
    result = checkout([300, 400], gateway)
    assert result == {'total_cents': 700, 'receipt': 'receipt-1'}
    gateway.charge.assert_called_once_with(700)
