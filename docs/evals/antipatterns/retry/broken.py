def send_order(service, intent_id):
    service.record_intent(intent_id)
    try:
        return service.submit(intent_id)
    except TimeoutError:
        return service.submit(intent_id + '-retry')
