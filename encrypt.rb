require 'openssl'

module AESCRYPT
  def AESCRYPT.decrypt(encrypted_data, key, iv, cipher_type)
    # Decrypts a block of data (encrypted_data) given an encryption key
    # and an initialization vector (iv)
    aes = OpenSSL::Cipher::Cipher.new(cipher_type)
    aes.decrypt
    aes.key = key
    aes.iv = iv if iv != nil
    aes.update(encrypted_data) + aes.final
  end

  def AESCRYPT.encrypt(data, key, iv, cipher_type)
    aes = OpenSSL::Cipher::Cipher.new(cipher_type)
    aes.encrypt
    aes.key = key
    aes.iv = iv if iv != nil
    aes.update(data) + aes.final
  end
end

key = "qwertyuiopasdfghjklzxcvbnmqwerty"
cipher_type = "AES-256-CBC"
data = "blahblah"
encrypted_data = AESCRYPT.encrypt(data, key, nil, cipher_type)

puts data
puts AESCRYPT.encrypt(data, key, nil, cipher_type)
puts encrypted_data
puts AESCRYPT.decrypt(encrypted_data, key, nil, cipher_type)
