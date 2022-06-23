Return-Path: <ksummit+bounces-696-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB561558B86
	for <lists@lfdr.de>; Fri, 24 Jun 2022 01:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F174B280C33
	for <lists@lfdr.de>; Thu, 23 Jun 2022 23:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFA14698;
	Thu, 23 Jun 2022 23:05:34 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F771FAC
	for <ksummit@lists.linux.dev>; Thu, 23 Jun 2022 23:05:32 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id z7so992188ioe.11
        for <ksummit@lists.linux.dev>; Thu, 23 Jun 2022 16:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=hk4ocVcEmV+Z8uXga+Qkz1EveSN89ToQFX212xbe7Z8=;
        b=BsR3yK4ctIeGOn+cB9JpTStj0tYC/xa0c8BlW7uJfu0TBdsCmwY/k+SyI2x2L3pbzh
         P74JfqZs99LybyTqRKx0c7mvXmnfTTqZ+WHTppDSRpp67g5kFkSH0joTI3CXl3wlmT2P
         WgbK7ZRsNIigcp5e1KD+aUaGteo8MN2Om/wMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=hk4ocVcEmV+Z8uXga+Qkz1EveSN89ToQFX212xbe7Z8=;
        b=RXB52tzWCaBtWi4ae/OPxaD/zzBACWNLlda5reZA8hFNPQpHodJDp3eyljkWgkkveW
         wKxFXd2JKAX4fVSBcWKzfUCJaYSyfaDgxPdhlTdbDUqQ+N53lDMtNhc45Kr2HHoySr9P
         un8qHdVGmKZthmWeYx27wuYll22dIMr2pdkeh4LZGrthTLcbr4KrYt/MvXPnuijEKdLq
         4tf+grP58AxmHU8agdvAqUMVNkSxPXwmUH7uZKwnWut+nFxZY5r+pxJUUnsCrbQhCUan
         pB4+f0O3mLa11qooxGSXgqZrUfut0gcRsrI7m5fx7JA3OraRtcUSec4fsAaqYJcv8A94
         epeQ==
X-Gm-Message-State: AJIora/4sKDkfQFfCjreqJTpXDAxFWOLUVRlTmtWrXv1K0skSZxCP6mk
	kWXws3SAKpSxWdBwO9NanDkrzw4LjmvKzA==
X-Google-Smtp-Source: AGRyM1vA8nIfT23B7yWQ3J1BPQ6CqCpGBG97wnnjPB8Xu2HT3r4v+H2YQ2F7TcrK1lLZLPfq39opig==
X-Received: by 2002:a05:6638:300f:b0:335:b12d:3126 with SMTP id r15-20020a056638300f00b00335b12d3126mr6885662jak.210.1656025531909;
        Thu, 23 Jun 2022 16:05:31 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id j12-20020a6b794c000000b0067275a52928sm378772iop.9.2022.06.23.16.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 16:05:31 -0700 (PDT)
To: ksummit <ksummit-discuss@lists.linuxfoundation.org>,
 ksummit@lists.linux.dev
Cc: Shuah Khan <skhan@linuxfoundation.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: [TECH TOPIC] Driver probe fails and register succeeds
Message-ID: <d39ab7f8-db79-2f0d-9d2c-ecce42505b10@linuxfoundation.org>
Date: Thu, 23 Jun 2022 17:05:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I have been debugging a driver probe failure and noticed that driver gets
registered even when driver probe fails. This is not a new behavior. The
code in question is the same since 2005.

dmesg will say that a driver probe failed with error code and then the very
next message from interface core that says driver is registered successfully.
It will create sysfs interfaces.

The probe failure is propagated from the drive probe routine all the way up to
__driver_attach(). __driver_attach() ignores the error and and returns success.

         __device_driver_lock(dev, dev->parent);
         driver_probe_device(drv, dev);
         __device_driver_unlock(dev, dev->parent);

         return 0;

Interface driver register goes on to create sysfs entries as if driver probe
worked. It handles errors from driver_register() and unwinds the register
properly, however in this case it doesn't know about the failure.

At this point the driver is defunct with sysfs interfaces. User has to run
rmmod to get rid of the defunct driver.

Simply returning the error from __driver_attach() didn't work as expected.
I figured it would fail since not all interface drivers can handle errors
from driver probe routines.

I propose that we discuss the scenario to find possible solutions to avoid
defunct drivers.

thanks,
-- Shuah



