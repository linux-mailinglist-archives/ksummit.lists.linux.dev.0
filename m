Return-Path: <ksummit+bounces-105-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7E7368465
	for <lists@lfdr.de>; Thu, 22 Apr 2021 18:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id CCD5F1C6288
	for <lists@lfdr.de>; Thu, 22 Apr 2021 16:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683992FA0;
	Thu, 22 Apr 2021 16:08:30 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497BA70
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 16:08:29 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id p8so24693902iol.11
        for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 09:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qGEWsTg+l+192htA/20iH9KxQd+8WJN8loTbl9hhDpE=;
        b=bnXstzv1qJDOPAQcC7bv6NEE87zSP6FxhJlhDEzCyVzO19E6c+gWf7UDR07mGbjwLg
         tbJlU4eUdAGMYrGy8vdz9xm0RwmVZmWWRL3SM49kn7D0bNU6OjgOcQYe7lYnkw7WMYMw
         AlrbVAOERmDT4MxwLM5uhJj40N1VV5F3v5kkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qGEWsTg+l+192htA/20iH9KxQd+8WJN8loTbl9hhDpE=;
        b=ugiYMan94COQjFb0sPcrTosJfVQ6D1HN+XxmgSFjHZUHA9wGn8ZlM0KJuS8fsG4snE
         15epQYxMnaGdhOAXyqoz2OF0SIdspUFAtqerE+mDn7Gl1PPyyARG20+TDvoGKL2NdnnF
         ePbFSLhVExxxao3tHnPIdYbfrDObnLpFYAZWd5WYBSVaZFD0n8lIyszU7cHzju/wOn7Z
         5Y+7jgmadE3U3r8PqWYmHZItaXKKnc3Szyzg94xGHGtvtTuAYgdRp3uLNlzOzyHWCAeX
         F4venL7huvAAwpyZVte2X4Ud0moNz78D6E9/rHoyYkUBo1wy9NhwfUNhTqfzRvpi1bmZ
         ffzA==
X-Gm-Message-State: AOAM531QbDlQCGPTLkdu6iKNqM4jybLZ5NIMae5qOcMzQclZ4Tb/jm9W
	JuVaAubkFD1vozqyIF3wMVu6sLss9Tf9DQ==
X-Google-Smtp-Source: ABdhPJy1W1DIMtmDFiZs+e7NKuD/ZCe6bft/JlDGc8dDKxDu4WqJgGjDGj37OQQwClMZBQsVmXzqOQ==
X-Received: by 2002:a6b:d213:: with SMTP id q19mr3297342iob.203.1619107708471;
        Thu, 22 Apr 2021 09:08:28 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id f18sm1337206ile.40.2021.04.22.09.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Apr 2021 09:08:28 -0700 (PDT)
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
To: Steven Rostedt <rostedt@goodmis.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 ksummit@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210422123559.1dc647fb@coco.lan>
 <0d83502f-eb29-9b06-ada8-fcd03f9c87a8@linuxfoundation.org>
 <a72a13e56ee5f19b0dee9ae8c1928b020e8809c2.camel@HansenPartnership.com>
 <dfa424e7e23f82965e7e956ef16abe6617534dd9.camel@HansenPartnership.com>
 <20210422115235.0526dabd@gandalf.local.home>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <0c6e9057-b7f5-f18d-5f88-beb95a33f41f@linuxfoundation.org>
Date: Thu, 22 Apr 2021 10:08:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210422115235.0526dabd@gandalf.local.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/22/21 9:52 AM, Steven Rostedt wrote:
> On Thu, 22 Apr 2021 08:48:21 -0700
> James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> 
>> On Thu, 2021-04-22 at 08:42 -0700, James Bottomley wrote:
>> [...]
>>>     2. Improving the requirement for bug fixes and large series, like
>>> cover letters to everyone, adding fixes: tag and clear explanation.
>>
>> Just on this one, can we get the mailing list to help now we're moving
>> to a new infrastructure?  I was already thinking of asking if it could
>> reject email with html parts rather than simply losing it, but perhaps
>> it could reject threaded submissions where the cover letter isn't
>> correctly cc'd?  I know that's a big ask because there has to be an
>> easy way to recognize them (heuristics on the PATCH tag?) and a way to
>> recognize missing cc's (perhaps simply that someone cc'd on the
>> threaded [PATCH x/y] reply isn't cc'd on [PATCH 0/y]?)
> 

One thing that would be helpful is rejecting patches that aren't cc'ed
to the maintainers. I have had two recent cases where the patches were
delegated to me in patchwork and I had to go find them. I did the
extra work primarily because the patch was sent by a new developer.

It adds extra work for sure.

> Unfortunately, this breaks all quilt users, as quilt does not support this.
> 
> Which includes myself, perhaps Peter Zijlstra, and I believe Andrew Morton.
> 
> I also, don't want to be Cc'd on the cover letter of stable patches, which
> also doesn't follow this procedure.
> 

I didn't realize quilt doesn't support it.

thanks,
-- Shuah



