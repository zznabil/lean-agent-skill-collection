def send_order(service, intent_id):
    service.record_intent(intent_id)
    try:
        return service.submit(intent_id)
    except TimeoutError:
        try:
            result = service.lookup(intent_id)
        except TimeoutError:
            return {'status': 'unknown'}
        if result['status'] == 'succeeded':
            return result
        return {'status': 'unknown'}
