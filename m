Return-Path: <ksummit+bounces-26-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F21A3675AE
	for <lists@lfdr.de>; Thu, 22 Apr 2021 01:22:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 68CF41C27A4
	for <lists@lfdr.de>; Wed, 21 Apr 2021 23:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2142FA2;
	Wed, 21 Apr 2021 23:21:52 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428882F9B
	for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 23:21:51 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id l9so515718ilh.10
        for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 16:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rXmNbQj388QWHnUatOp5dKj2tzD8PZ7Io4X+siwuwqQ=;
        b=gXYE0RN+ZGBEp2Vu5YTshVtrKhg9b3rPNZotEneSiDzxzR5P7GWXdAXqT32bC5KzyZ
         81pAw5Jgsx3gGYNLx8AyPTbcerA4ZqaYB7qgCXvYTk3YDzIrqtKTaY+3H0MRFlV8e8xp
         ZSF6El+XWpzfsSQdaLg9IUWfUIwnkuah3bPwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rXmNbQj388QWHnUatOp5dKj2tzD8PZ7Io4X+siwuwqQ=;
        b=S8dtX8sl3PVQDvm9Zi4QekwnurjJF7WPR5bXLCbr9XSadZk8vK2GihckKs+AjhtuK0
         XhSwuWvaJzC14jGKIBFZB9LSprYY0wHdwTHJDLqyliWAg2aQWsSk1FBdywEl2VAvUyUB
         mP9KZb1v6SZRZazoP0yb//FWWCO0U8WE1+ye9Opzc+YzezSS0BXCmSkNSliHYkJF93yx
         qJqB1g0u/dBnDhp5VMAn86aBAIqLi97JW0DUumhqmEUyWK8Cw6g+GiJMIZ7sMYH99H7l
         zLbeLGf4ZvFW+h5kcRSPaUzX85mPJTDBe3uDCmhFrIlEWa94qXujJ3UrxKJPxSgEvk47
         RQ+g==
X-Gm-Message-State: AOAM532nOd+62DtqowsnofJnC/MYCl5Jml19QcG0J0s0CMBnJImOpjDn
	E5VWURwZtkBu1meyB5HBwTrwIQ==
X-Google-Smtp-Source: ABdhPJzPrHpCsJ7RlZdO0S1G4O6Vcvt9pUpUwDJNIMsF+QwtEQxaYHyM8G+EYNtBwIiwQALt7gD48Q==
X-Received: by 2002:a92:ca06:: with SMTP id j6mr389515ils.234.1619047310384;
        Wed, 21 Apr 2021 16:21:50 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id l5sm373007ils.61.2021.04.21.16.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Apr 2021 16:21:49 -0700 (PDT)
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jiri Kosina <jkosina@suse.cz>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 ksummit@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <nycvar.YFH.7.76.2104212125330.18270@cbobk.fhfr.pm>
 <nycvar.YFH.7.76.2104212226420.18270@cbobk.fhfr.pm>
 <a49275f4-ebb9-8a12-1911-cf3114cb35c2@linuxfoundation.org>
 <20210421231707.GA131841@roeck-us.net>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <7812d396-79ff-2ed6-136b-cff0e695bcee@linuxfoundation.org>
Date: Wed, 21 Apr 2021 17:21:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210421231707.GA131841@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/21/21 5:17 PM, Guenter Roeck wrote:
> On Wed, Apr 21, 2021 at 04:18:15PM -0600, Shuah Khan wrote:
>> On 4/21/21 2:28 PM, Jiri Kosina wrote:
>>> On Wed, 21 Apr 2021, Jiri Kosina wrote:
>>>
>>>> I am all for discussing policy of trivial patches (*), but just to make it
>>>> clear -- I don't think that's really directly related to the University of
>>>> Minnesota issue.
>>>
>>> (*) saying that as a de-facto maintainer of trivial.git, although that
>>>       tree has been severely neglected over the past years. Also, as far as
>>>       I can say, none of the umn.edu patches went in through the trivial
>>>       tree
>>>
>>
>> I agree. I looked at a few including this one:
>>
>> 8e949363f017e2011464812a714fb29710fb95b4
>> net: mlx5: Add a missing check on idr_find, free buf
>>
> 
> Coincidentally that introduced a UAF (or, rather, made an existing UAF
> worse) which was later fixed with commit 31634bf5dcc4. Was that one of
> the experiments ?
> 

Correct. The problem was found and fixed in subsequent commits.

thanks,
-- Shuah


