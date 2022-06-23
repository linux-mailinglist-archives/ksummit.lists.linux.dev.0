Return-Path: <ksummit+bounces-699-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [139.178.84.19])
	by mail.lfdr.de (Postfix) with ESMTPS id DC011558BB4
	for <lists@lfdr.de>; Fri, 24 Jun 2022 01:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id BF89F2E0A80
	for <lists@lfdr.de>; Thu, 23 Jun 2022 23:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91CEF469B;
	Thu, 23 Jun 2022 23:28:13 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B84A1FAC
	for <ksummit@lists.linux.dev>; Thu, 23 Jun 2022 23:28:12 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id l24so1018692ion.13
        for <ksummit@lists.linux.dev>; Thu, 23 Jun 2022 16:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GA5lpmhObCiL0lSohveQT6nXcAIEL864nl7rYQmtCZY=;
        b=cy6LIeamnUvQ7l+cczBCrQ0wk15oBIISkhZ9URN/ltoNpFx6Q7mi5/Dk5f98e6/UGw
         pYe1mtKww8kZh0z3NMNjDWO0dQpbwKDdT7zHiCGrmUlw3PXJIhqyJyUtYV20DXkgPzbm
         zgqAar2Y/ZfOLdefI0owwRL7essTH7MWs25Z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GA5lpmhObCiL0lSohveQT6nXcAIEL864nl7rYQmtCZY=;
        b=XXSk3go44Znsa+IxpWe1jpyNcb2nTeerZX0PaF6akThIDEP5WO2OaLzcdgX3Rzd02z
         63DAMuQYw96a0BDzbVOq+yNVx3vKjlNihLOatDIaD7rne0XQhNXpwDonzRouu6dq48Ay
         v7bfdA6aKmxhv0VsQrIodsaBcswEO/cdvM5yWHibRz/0JCoqpwyLD4c8zJxYqHdndtdb
         +Ew0KGNfwLWcTiVPe7/PuODWTZFRclPiwbvdhaGC+z1u2gaG5ZM5beI+QIo3eCXZv8DQ
         ByyGD09vxnRjT7Vf+z76TS8BUr0Q+gNVAJR7N+sFVBeNZwDg95mSAEcXoaOikNAPypmA
         W2Dg==
X-Gm-Message-State: AJIora8fhl4eD5ei5VnACLZSQXTLsjSD0jR4r4i1POqgriYBxG2X5fLn
	JQ91E14hjIEx0rTs9qR42/eXNAkGIMbtdg==
X-Google-Smtp-Source: AGRyM1txAc6xIiQS4O3jOyyTA1qsgKTESb071SrEU1WG458l0uaqVol+zjxcydMH1fg7OA+IE0dZwA==
X-Received: by 2002:a5d:9342:0:b0:654:9336:81d7 with SMTP id i2-20020a5d9342000000b00654933681d7mr6055573ioo.136.1656026890559;
        Thu, 23 Jun 2022 16:28:10 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id q189-20020a6b8ec6000000b0065a47e16f4esm394046iod.32.2022.06.23.16.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 16:28:09 -0700 (PDT)
Subject: Re: [TECH TOPIC] Driver probe fails and register succeeds
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: ksummit <ksummit-discuss@lists.linuxfoundation.org>,
 ksummit@lists.linux.dev
References: <d39ab7f8-db79-2f0d-9d2c-ecce42505b10@linuxfoundation.org>
 <YrTzmJJEY4bwEBB7@pendragon.ideasonboard.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <a3de118e-1ef8-ac79-cf0c-e5e55a1238c8@linuxfoundation.org>
Date: Thu, 23 Jun 2022 17:28:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YrTzmJJEY4bwEBB7@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/23/22 5:13 PM, Laurent Pinchart wrote:
> Hi Shuah,
> 
> On Thu, Jun 23, 2022 at 05:05:30PM -0600, Shuah Khan wrote:
>> I have been debugging a driver probe failure and noticed that driver gets
>> registered even when driver probe fails. This is not a new behavior. The
>> code in question is the same since 2005.
>>
>> dmesg will say that a driver probe failed with error code and then the very
>> next message from interface core that says driver is registered successfully.
>> It will create sysfs interfaces.
>>
>> The probe failure is propagated from the drive probe routine all the way up to
>> __driver_attach(). __driver_attach() ignores the error and and returns success.
>>
>>           __device_driver_lock(dev, dev->parent);
>>           driver_probe_device(drv, dev);
>>           __device_driver_unlock(dev, dev->parent);
>>
>>           return 0;
>>
>> Interface driver register goes on to create sysfs entries as if driver probe
>> worked. It handles errors from driver_register() and unwinds the register
>> properly, however in this case it doesn't know about the failure.
>>
>> At this point the driver is defunct with sysfs interfaces. User has to run
>> rmmod to get rid of the defunct driver.
>>
>> Simply returning the error from __driver_attach() didn't work as expected.
>> I figured it would fail since not all interface drivers can handle errors
>> from driver probe routines.
>>
>> I propose that we discuss the scenario to find possible solutions to avoid
>> defunct drivers.
> 
> This seems to be the expected behaviour to me. The probe failure doesn't
> necessarily indicate that the driver is at fault, it means that
> something went wrong when associating a particular device with the
> driver. It could be that the device is faulty for instance, and that
> shouldn't prevent the driver from being registered, especially if
> multiple instances of the device can be present in the system, as that
> would then prevent any of those instances from working due to one faulty
> device.
> 

Agreed. This behavior works well in the cases of hardware/device failures
that cause probe failure. The case I am seeing is a driver bug that causes
probe failure.

> What other behaviour would you expect ?
> 

I am looking to see if we can propagate the error to the interface driver to
handle instead of leaving the defunct driver. This isn't an easy problem to
solve though. As you mentioned driver probe could fail if device is bad
and we want the driver to handle the others.

The fact is we will end up with defunct drivers in some cases. If user notices
the error they could go clean it up. My main concern is the sysfs interfaces
hanging around. The desired behavior would be not leaving defunct drivers with
associated sysfs files.

thanks,
-- Shuah





