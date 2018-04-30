<?php echo $header; ?>

<?php if ($error_warning): ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php endif; ?>

<div class="box">
    <div class="heading">
        <h1 style="background-image: url('view/image/payment.png');">
            <?php echo $heading_title; ?>
        </h1>
        <div class="buttons">
            <a onclick="$('#form').submit();" class="button">
                <span><?php echo $button_save; ?></span>
            </a>
            <a onclick="location = '<?php echo $cancel; ?>';" class="button">
                <span><?php echo $button_cancel; ?></span>
            </a>
        </div>
    </div>

    <div class="content">
        <div>
            <?php if(in_array($_SERVER['REMOTE_ADDR'], array('127.0.0.1', '::1'))) { ?>
            <div>
                We have noticed that you are using <i>localhost</i> to host your website. Please take note that we may
                not
                be able to send payment callback to localhost. You must make your website available from outside.
            </div>
            <?php } ?>
        </div>

        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
            <table class="form">
                <tr>
                    <td width="25%"><?php echo $status_label; ?></td>
                    <td>
                        <select name="coingate_status">
                            <?php if ($coingate_status): ?>
                            <option value="1" selected="selected"><?php echo $status_on; ?></option>
                            <option value="0"><?php echo $status_off; ?></option>
                            <?php else: ?>
                            <option value="1"><?php echo $status_on; ?></option>
                            <option value="0" selected="selected"><?php echo $status_off; ?></option>
                            <?php endif; ?>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>
                        <span class="required">*</span> <?php echo $api_auth_token_label; ?>
                    </td>
                    <td>
                        <input type="text" name="coingate_api_auth_token" value="<?php echo $coingate_api_auth_token; ?>"/>
                        <br/>
                        <?php if ($api_auth_token_error) { ?>
                        <span class="error"><?php echo $api_auth_token_error; ?></span>
                        <?php } ?>
                    </td>
                </tr>

                <tr>
                    <td><?php echo $test_label; ?></td>
                    <td>
                        <select name="coingate_test">
                            <?php if($coingate_test == 0): ?>
                            <option value="0" selected="selected"><?php echo $test_off; ?></option>
                            <option value="1"><?php echo $test_on; ?></option>
                            <?php else: ?>
                            <option value="0"><?php echo $test_off; ?></option>
                            <option value="1" selected="selected"><?php echo $test_on; ?></option>
                            <?php endif;?>
                        </select>
                        <p>
                            Enable "test mode" to test on <a href="https://sandbox.coingate.com/"
                                                             target="_blank">sandbox.coingate.com</a>.
                            Please note, that for "Test" mode you must generate separate API credentials on
                            sandbox.coingate.com. API credentials generated on coingate.com will not work for "Test"
                            mode.
                        </p>
                    </td>
                </tr>

                <tr>
                    <td><?php echo $receive_currency_label; ?></td>
                    <td>
                        <select name="coingate_receive_currency">
                            <?php foreach(array('eur', 'usd', 'btc') as $currency): ?>
                            <option value="<?php echo $currency; ?>"
                            <?php echo $currency == $coingate_receive_currency ? 'selected' : ''; ?>>
                            <?php echo $currencies_label[$currency]; ?>
                            </option>
                            <?php endforeach; ?>
                        </select>

                        <?php if ($receive_currency_error): ?>
                        <span class="error"><?php echo $receive_currency_error; ?></span>
                        <?php endif; ?>

                        <p>
                            Currency you want to receive when making withdrawal at CoinGate. Please take a note what if
                            you choose EUR or USD you will be asked to verify your business before making a withdrawal
                            at CoinGate.
                        </p>
                    </td>
                </tr>

                <tr>
                    <td><?php echo $new_order_status_label; ?></td>
                    <td>
                        <select name="coingate_new_order_status_id">
                            <?php foreach ($order_statuses as $order_status): ?>
                            <?php if ($order_status['order_status_id'] == $coingate_new_order_status_id): ?>
                            <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected">
                                <?php echo $order_status['name']; ?>
                            </option>
                            <?php else: ?>
                            <option value="<?php echo $order_status['order_status_id']; ?>">
                                <?php echo $order_status['name']; ?>
                            </option>
                            <?php endif; ?>
                            <?php endforeach; ?>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td><?php echo $cancelled_order_status_label; ?></td>
                    <td>
                        <select name="coingate_cancelled_order_status_id">
                            <?php foreach ($order_statuses as $order_status): ?>
                            <?php if ($order_status['order_status_id'] == $coingate_cancelled_order_status_id): ?>
                            <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected">
                                <?php echo $order_status['name']; ?>
                            </option>
                            <?php else: ?>
                            <option value="<?php echo $order_status['order_status_id']; ?>">
                                <?php echo $order_status['name']; ?>
                            </option>
                            <?php endif; ?>
                            <?php endforeach; ?>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td><?php echo $expired_order_status_label; ?></td>
                    <td>
                        <select name="coingate_expired_order_status_id">
                            <?php foreach ($order_statuses as $order_status): ?>
                            <?php if ($order_status['order_status_id'] == $coingate_expired_order_status_id): ?>
                            <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected">
                                <?php echo $order_status['name']; ?>
                            </option>
                            <?php else: ?>
                            <option value="<?php echo $order_status['order_status_id']; ?>">
                                <?php echo $order_status['name']; ?>
                            </option>
                            <?php endif; ?>
                            <?php endforeach; ?>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td><?php echo $failed_order_status_label; ?></td>
                    <td>
                        <select name="coingate_failed_order_status_id">
                            <?php foreach ($order_statuses as $order_status): ?>
                            <?php if ($order_status['order_status_id'] == $coingate_failed_order_status_id): ?>
                            <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected">
                                <?php echo $order_status['name']; ?>
                            </option>
                            <?php else: ?>
                            <option value="<?php echo $order_status['order_status_id']; ?>">
                                <?php echo $order_status['name']; ?>
                            </option>
                            <?php endif; ?>
                            <?php endforeach; ?>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td><?php echo $completed_order_status_label; ?></td>
                    <td>
                        <select name="coingate_completed_order_status_id">
                            <?php foreach ($order_statuses as $order_status): ?>
                            <?php if ($order_status['order_status_id'] == $coingate_completed_order_status_id): ?>
                            <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected">
                                <?php echo $order_status['name']; ?>
                            </option>
                            <?php else: ?>
                            <option value="<?php echo $order_status['order_status_id']; ?>">
                                <?php echo $order_status['name']; ?>
                            </option>
                            <?php endif; ?>
                            <?php endforeach; ?>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td><?php echo $refunded_order_status_label; ?></td>
                    <td>
                        <select name="coingate_refunded_order_status_id">
                            <?php foreach ($order_statuses as $order_status): ?>
                            <?php if ($order_status['order_status_id'] == $coingate_refunded_order_status_id): ?>
                            <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected">
                                <?php echo $order_status['name']; ?>
                            </option>
                            <?php else: ?>
                            <option value="<?php echo $order_status['order_status_id']; ?>">
                                <?php echo $order_status['name']; ?>
                            </option>
                            <?php endif; ?>
                            <?php endforeach; ?>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td><?php echo $entry_total; ?></td>
                    <td>
                        <input type="text" name="coingate_total" value="<?php echo $coingate_total; ?>"/>
                    </td>
                </tr>

                <tr>
                    <td><?php echo $entry_geo_zone; ?></td>
                    <td>
                        <select name="coingate_geo_zone_id">
                            <option value="0"><?php echo $text_all_zones; ?></option>
                            <?php foreach ($geo_zones as $geo_zone): ?>
                            <?php if ($geo_zone['geo_zone_id'] == $coingate_geo_zone_id): ?>
                            <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected">
                                <?php echo $geo_zone['name']; ?>
                            </option>
                            <?php else: ?>
                            <option value="<?php echo $geo_zone['geo_zone_id']; ?>">
                                <?php echo $geo_zone['name']; ?>
                            </option>
                            <?php endif; ?>
                            <?php endforeach; ?>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td><?php echo $sort_order_label; ?></td>
                    <td>
                        <input type="text" name="coingate_sort_order" value="<?php echo $coingate_sort_order; ?>"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

<form action="<?php echo $action; ?>" method="POST" id="refresh">
    <input type="text" name="refresh" value="1" style="display: none;"/>
</form>

<?php echo $footer; ?>
