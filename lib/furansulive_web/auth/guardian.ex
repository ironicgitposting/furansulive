defmodule FuransuliveWeb.Auth.Guardian do
  use Guardian, otp_app: :furansulive

  alias Furansulive.Accounts

  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = Accounts.get_user!(id)
    {:ok, resource}
  end

  def authenticate_phone(email, password) do
    # HTTP Bearer authorization.
    with {:ok, user} <- Accounts.get_by_email(email) do
      case validate_password(password, user) do
        true ->
          create_phone_token(user)

        false ->
          {:error, :unauthorized}
      end
    end
  end

  defp validate_password(password, user) do
    # Pbkdf2 only used as dev hashing strategy
    case Pbkdf2.check_pass(user, password) do
      {:ok, _} -> true
      {:error, _} -> false
    end
  end

  defp create_token(user) do
    {:ok, token, _claims} = encode_and_sign(user)
    {:ok, user, token}
  end

  defp create_phone_token(user) do
    # Long token for React Native App
    {:ok, token, _claims} = encode_and_sign(user, %{}, ttl: {4, :weeks})
    {:ok, user, token}
  end
end
