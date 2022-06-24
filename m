Return-Path: <ksummit+bounces-707-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B98DD559DBA
	for <lists@lfdr.de>; Fri, 24 Jun 2022 17:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D0B1280C73
	for <lists@lfdr.de>; Fri, 24 Jun 2022 15:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26C733E8;
	Fri, 24 Jun 2022 15:55:55 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B87133C1
	for <ksummit@lists.linux.dev>; Fri, 24 Jun 2022 15:55:54 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id z191so3122973iof.6
        for <ksummit@lists.linux.dev>; Fri, 24 Jun 2022 08:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=k0Nh9K4Ic4YrNZubsbz7hDPP6U+3hvexJG5DAFPaO4Y=;
        b=WDYjbnhyD3nPdD10lxgxPjUUdGBfThZep4sjqzRbemeI2rDMCYpzmnUcBWQVtZx1YM
         GnWzP95aqUHGMa+nQPC51MscGoUxXYL+Zo1bDRjNFdEUfPWdm7cU3B0j+YP2ZrNhCGZc
         KC5sUbnAf6rq3dVqCTQpFicYQWp6bBWJQx7mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k0Nh9K4Ic4YrNZubsbz7hDPP6U+3hvexJG5DAFPaO4Y=;
        b=Gt3GxNcswaG3xfhYaUjuBD4K6nE3C7qcyToPbwZ5m+mHO/3eJBSKRQcaWSTFmmARBL
         xFFiZaLOYfWqeJuOxaOwTDr1TdS8FSs+F93Z4wKxQnSVV29hhNrYrTSh2hMB8b1BDEBt
         4RwvfEFhyUjXPY55MEItlFf5H4L+htBvAiGurW8gwi1+LzlvZy568CJhm7SJjoH58WkY
         2HD+pZLBayTTQy7vCztBgJ/NTUssNYD2/15fAooCdR6JZZwp8UpEdE3MCBmciqXNCM7e
         iMjLZgDQ8q18N5/72F9sO6qQyWYGv6L6jyhPBps/lgabP618JcNikd0Ypxi4ZmEC3NcM
         O/HA==
X-Gm-Message-State: AJIora+xG0BKJEJL/GP6+HDoUDC/LmRGzee/L1djU3I/xkGa4LjSSCYr
	Ylc5v59WlSQaSvfzzwVajEhTsA==
X-Google-Smtp-Source: AGRyM1v61mvlO6AGKFiAJNUlA8uJWpE9SOfPrLiz7Z9SZ9Y/N/c40Vnvbxh2lB8iAWp8QHb8P9IYJA==
X-Received: by 2002:a6b:6a07:0:b0:66a:2e5f:2058 with SMTP id x7-20020a6b6a07000000b0066a2e5f2058mr7797569iog.72.1656086153351;
        Fri, 24 Jun 2022 08:55:53 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id j18-20020a056638053200b0033792143bf5sm1200083jar.67.2022.06.24.08.55.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 08:55:53 -0700 (PDT)
Subject: Re: [TECH TOPIC] Driver probe fails and register succeeds
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ksummit <ksummit-discuss@lists.linuxfoundation.org>,
 ksummit@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <d39ab7f8-db79-2f0d-9d2c-ecce42505b10@linuxfoundation.org>
 <YrVaPvqE+lB42OPD@kroah.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <7e4ca4bb-fb34-7886-927c-c13f7da44b80@linuxfoundation.org>
Date: Fri, 24 Jun 2022 09:55:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YrVaPvqE+lB42OPD@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/24/22 12:31 AM, Greg KH wrote:
> On Thu, Jun 23, 2022 at 05:05:30PM -0600, Shuah Khan wrote:
>> I have been debugging a driver probe failure and noticed that driver gets
>> registered even when driver probe fails. This is not a new behavior. The
>> code in question is the same since 2005.
> 
> As others have pointed out, this is "by design".  Probe is independent
> of a driver registering in the kernel (i.e. module_init()) and should
> never determine if a module is to not be loaded or not.
> 
> That was part of the explicit design of the driver model we did back in
> the 2.5 kernel days.  We don't want to go back to the old style of "if a
> module can not find a device to control, fail to load" model, it does
> not work well for a variety of reasons.
> 

Thank you - this is helpful.

> So it sounds like the driver is working properly for this portion of it,
> we can discuss the specifics of it on the subsystem-specific mailing
> list to find out of anything else is currently wrong with it, but I
> don't think this needs to be a tech topic from what I can tell.
> 

Thank you. Makes sense. This driver probe failure is a bug that needs to
be fixed. I have a few fixes to send.

thanks,
-- Shuah


