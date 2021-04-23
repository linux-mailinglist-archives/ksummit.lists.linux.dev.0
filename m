Return-Path: <ksummit+bounces-154-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 350833694FB
	for <lists@lfdr.de>; Fri, 23 Apr 2021 16:42:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 72BA51C8223
	for <lists@lfdr.de>; Fri, 23 Apr 2021 14:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6B72FA5;
	Fri, 23 Apr 2021 14:41:40 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D1470
	for <ksummit@lists.linux.dev>; Fri, 23 Apr 2021 14:41:38 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id i22so36193799ila.11
        for <ksummit@lists.linux.dev>; Fri, 23 Apr 2021 07:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2j/HuVc0abb5dmz+Pzz4ut3LEV5kUAK2gCFV0PAKvFw=;
        b=TTSzOrKoWNwfd+uF0GsB6xN6tNhwEjGe7rbtSIiI8a6+4yp0DKx17mMICit66czmDV
         6YXb+YC/G+V0nz1sv7tIPZeEHkJrUaX3J+O7eVVMhmFDlUZE9p7UdZ77hCFbzQAPNqYS
         HY7IYsuuuedLlzYaXaqbuiakAXBAxPsDbel/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2j/HuVc0abb5dmz+Pzz4ut3LEV5kUAK2gCFV0PAKvFw=;
        b=E8lFqGBa3cOPEZ3LH6FS/kLfNMDjIm++HkI8igyNJf1QVLJ1RtFs9ENwbpZRxcEsE/
         of2plo+aZkY9P9IJeNb11mTU7lFe7z3xrGwRJjVtnzov4tkOGTI2okwNyGoCszpX22lJ
         JTWBQamkOPXrp+DHmraWCb2xSOQ950+DzgzXoK2pBa/1ecYRmkiVM3RnbTSwqPC2W4c9
         75Rq7Fqp2ZoFsXiylUJkUnsIz34w4k/vVibzrjzFvsL7T9s20lnpqmnc++Z/xndKeGtV
         29WVxHaKOhh6am/I358T0X3Yn8ArfjfDJK/s12NkrDeyG6uL/s8/fVXyI99H0F+3t/tI
         Hzrg==
X-Gm-Message-State: AOAM531YGnHqWtT6MZ0JBdCy2ISzOXg86G11+WZVJaq7KP/9B7pxmytw
	nROf6ZA+aDufrfY/9NsbK0qWkw==
X-Google-Smtp-Source: ABdhPJwNhoNhrOJS4YiAC/QJ7enj76qK6MoB2vg8f1z40JxBO8cbjypTZo37Y1LK1AwjogjW34bsdA==
X-Received: by 2002:a92:611:: with SMTP id x17mr3187545ilg.239.1619188898232;
        Fri, 23 Apr 2021 07:41:38 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id d18sm2912275ioo.50.2021.04.23.07.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Apr 2021 07:41:37 -0700 (PDT)
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
To: Geert Uytterhoeven <geert@linux-m68k.org>, Greg KH <greg@kroah.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Leon Romanovsky <leon@kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 ksummit@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal> <20210422124023.GD4572@sirena.org.uk>
 <YIFx/iorjncjslob@linux.ibm.com> <20210422132339.GF4572@sirena.org.uk>
 <20210422111939.0c555039@gandalf.local.home> <YIJmBvtU74D+N2DL@kroah.com>
 <CAMuHMdV5UxsHu9WyahuXAzCzP2k4wwrexA7g-pB4XyzctMcZ+Q@mail.gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <8f0b3a36-813e-f798-73d3-8e5f52948de4@linuxfoundation.org>
Date: Fri, 23 Apr 2021 08:41:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV5UxsHu9WyahuXAzCzP2k4wwrexA7g-pB4XyzctMcZ+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/23/21 1:13 AM, Geert Uytterhoeven wrote:
> Hi Greg,
> 
> On Fri, Apr 23, 2021 at 8:17 AM Greg KH <greg@kroah.com> wrote:
>> On Thu, Apr 22, 2021 at 11:19:39AM -0400, Steven Rostedt wrote:
>>> On Thu, 22 Apr 2021 14:23:39 +0100
>>> Mark Brown <broonie@kernel.org> wrote:
>>>>> For me the most annoying is to get several patches from the middle of a
>>>>> series. IMHO, sending at least cover letter to everyone is the bare minimum
>>>>> so that people at least can take a look at high level details and request a
>>>>> repost.
>>>>
>>>> Yes, the cover letter should always go to everyone.
>>>
>>> And that's still the one thing that quilt send-mail does not support :-p
>>
>> 'git format-patch --cover-letter' also does not seem to support this, so
>> what tool does?
> 
> You can (manually) add "Cc: name <address>" lines to the individual
> files created by "git format-patch", which will be used by
> "git send-email".
> I guess this can also be done to the mbox saved by "quilt mail --mbox"?
> 

I add them manually compiling list for individual patches in a series.

thanks,
-- Shuah

