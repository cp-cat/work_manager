class CustomDate extends Date {
  /**
   * 日時を指定フォーマットに変換
   *
   * @param {String} format
   * @return {String} フォーマット後の日時
   * @memberof CustomDate
   * @example "yyyy年MM月dd日 HH:mm:ss"
   */
  strfdate(format) {
    // フォーマットを数字で上書き
    format = format.replace(/yyyy/g, this.getFullYear());
    format = format.replace(/MM/g, ("0" + (this.getMonth() + 1)).slice(-2));
    format = format.replace(/dd/g, ("0" + this.getDate()).slice(-2));
    // format = format.replace(/HH/g, ("0" + this.getHours()).slice(-2));
    format = format.replace(/HH/g, this.getHours());
    format = format.replace(/mm/g, ("0" + this.getMinutes()).slice(-2));
    format = format.replace(/ss/g, ("0" + this.getSeconds()).slice(-2));
    format = format.replace(/SSS/g, ("00" + this.getMilliseconds()).slice(-3));
    return format;
  }
}
