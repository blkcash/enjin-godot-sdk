extends Reference
class_name TrustedPlatformClient

var _base_url: String
var _http: EnjinHttp
var _state: TrustedPlatformState setget ,get_state
var _middleware: TrustedPlatformMiddleware
var _auth_service: EnjinAuthService setget ,auth_service
var _user_service: EnjinUserService setget ,user_service

func _init(base_url: String = EnjinHosts.KOVAN):
    _base_url = base_url
    _http = EnjinHttp.new(_base_url)
    _state = TrustedPlatformState.new()
    _middleware = TrustedPlatformMiddleware.new(_http, _state)
    _auth_service = EnjinAuthService.new(_state, _middleware)
    _user_service = EnjinUserService.new(_middleware)

func get_state() -> TrustedPlatformState:
    return _state

func auth_service() -> EnjinAuthService:
    return _auth_service

func user_service() -> EnjinUserService:
    return _user_service