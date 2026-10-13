def send_order(service, intent_id):
    service.record_intent(intent_id)
    for attempt in range(2):
        try:
            result = service.submit(intent_id)
        except TimeoutError:
            try:
                result = service.lookup(intent_id)
            except TimeoutError:
                return {'status': 'unknown'}
            return result if result['status'] == 'succeeded' else {'status': 'unknown'}
        if result['status'] != 'retryable_failure' or attempt == 1:
            return result
        # This status guarantees that no order was created. Retry once.
