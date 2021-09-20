Return-Path: <ksummit+bounces-624-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE3F411CB8
	for <lists@lfdr.de>; Mon, 20 Sep 2021 19:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 1FD343E0E77
	for <lists@lfdr.de>; Mon, 20 Sep 2021 17:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF4A3FCB;
	Mon, 20 Sep 2021 17:10:51 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8013FC0
	for <ksummit@lists.linux.dev>; Mon, 20 Sep 2021 17:10:50 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id w8so5541905qvu.1
        for <ksummit@lists.linux.dev>; Mon, 20 Sep 2021 10:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=labbott.name; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Y6nvQb0L48eSzQFJoONTKkgY7weF0wuR5ubctAfNdmw=;
        b=mBY4ZBIxeXQy5PndrWozNlXND0HELUcnxwFwBBelMqWmWaxhwxLg+2uDCYXj/m2zmO
         4tZvgfcUzr7mrIKiC2Uy1/Ci/r3DZF3v6P9slYcSpvkXKhksXOwub3imBtnpwLLsqoXF
         p5cuTDlrSy2ZGREd9OlTIlTbGtpNBDLecTds0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Y6nvQb0L48eSzQFJoONTKkgY7weF0wuR5ubctAfNdmw=;
        b=Tkt1s6UKRfgy5HRzx4ALz9hjFF/VWX70qvc9CE+4KxUpdZjBx89TtN3D4KIA6VFFfA
         aSvrrKdXxyY+bDfqpEBy2vA3Do1noj12uQg7UKrrKThNpLg9qnKLfuZmAN/PUHxdhnt0
         fsVg+eCGmoSGDrR6B66STqiLRME1Numicn+hFJg6wTLej9oKm/aa3uKbpUNLHAWeAyng
         FOt2kX242PqeQEyAXchqcv0T7yGeHin2jcRowgWmJkCqsD9s4h11bWzRKZyLFAkcD9bw
         aIsy7W3M8/qdiXDt5SPREYxFO10obXnbeOk9j6lSsNXsOQi6Zd0ahJkkaf2FHgIv/Q3G
         DZKw==
X-Gm-Message-State: AOAM533Eg/kJ6wjUj0mfNnDCSJnBWXXyvH0vilsDX3NdrVdSU7DMgnDa
	zN4acVm5e/9RP6fAC1NxgfzPyw==
X-Google-Smtp-Source: ABdhPJxI34IkZe2zkjnmzZE9LyndlQADUdCivzVMUlD1PwBYUol1UnDEOIYGdAY3EscZ3c4aqpfR7Q==
X-Received: by 2002:a0c:ab01:: with SMTP id h1mr26235633qvb.0.1632157849823;
        Mon, 20 Sep 2021 10:10:49 -0700 (PDT)
Received: from [192.168.1.168] (pool-74-109-246-95.pitbpa.fios.verizon.net. [74.109.246.95])
        by smtp.gmail.com with ESMTPSA id bj31sm1564398qkb.43.2021.09.20.10.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Sep 2021 10:10:49 -0700 (PDT)
Message-ID: <0279daae-f1f9-b52c-6aef-f016914b21bc@labbott.name>
Date: Mon, 20 Sep 2021 13:10:48 -0400
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [Tech-board-discuss] IMPORTANT: CIVS opt-in for Technical
 Advisory Board voting
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Dave Hansen <dave@sr71.net>,
 "tab-elections@lists.linuxfoundation.org"
 <tab-elections@lists.linuxfoundation.org>, ksummit@lists.linux.dev,
 "tech-board-discuss@lists.linuxfoundation.org"
 <tech-board-discuss@lists.linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <44ee2bfe-e4bc-b918-b908-7352ea012524@oxidecomputer.com>
 <dfa20866-0d00-9bd3-6078-5544cfa5b633@sr71.net>
 <CAMuHMdUUfm6u_Pz3qzA0V7tLZd7jhcwdyxU7L0SyC_EdyzwQxw@mail.gmail.com>
 <CAMuHMdVtHDQ2f0VKAdQFQV9dZJ5uFGD9yHvNviQ_k7AEfhN77w@mail.gmail.com>
 <bf22702e-01b2-214a-1650-da9e4ec3c2be@labbott.name>
 <20210920162329.GJ4192@sirena.org.uk>
 <5c88ae67-df7b-60ab-d087-bd244753c98f@labbott.name>
 <20210920164837.GK4192@sirena.org.uk>
 <ebcaac1d-9b97-81d9-28eb-eeb51c51673f@labbott.name>
 <20210920165716.GL4192@sirena.org.uk>
From: Laura Abbott <laura@labbott.name>
In-Reply-To: <20210920165716.GL4192@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/21 12:57, Mark Brown wrote:
> On Mon, Sep 20, 2021 at 12:53:48PM -0400, Laura Abbott wrote:
>> On 9/20/21 12:48, Mark Brown wrote:
> 
>>> How can I do this?  As (IIRC) Geert reported if you've activated your
>>> mail then attempting to activate again causes CIVS to report "This email
>>> address is already activated" with no link to any existing polls.
> 
>> CIVS said it should give a list of all polls but perhaps that didn't
>> happen. I'll see if I can get it to resend.
> 
> It gives a list of all polls on activation but it seems like it doesn't
> get that far on reactivations, it looks like it's generating an error
> refusing to activate again before it gets that far.
> 

I just resent the links again. The e-mail server from CIVS can be a bit
slow. Thanks everyone for your patience here.

Thanks,
Laura

