Return-Path: <ksummit+bounces-1292-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0490D909C6F
	for <lists@lfdr.de>; Sun, 16 Jun 2024 10:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 004161C20B58
	for <lists@lfdr.de>; Sun, 16 Jun 2024 08:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C834D1836FB;
	Sun, 16 Jun 2024 08:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jjdxspsb"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84549944F
	for <ksummit@lists.linux.dev>; Sun, 16 Jun 2024 08:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718525440; cv=none; b=pHqQ9B5OIsOUonPgnb2z29dT3GjYqIjX0GRnuAXi4+OftEUIIJgkt4TeKFwqXDg32Yz2A4aT0tbszGethfh2m5FfgIHfOvbbG7FsxHuVJawvdsJibh0eIpnuHW8HR0z/qkq6kDpK4Roe/+PGbSRNUUDG99ZAuA/UfGXTCEIRf2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718525440; c=relaxed/simple;
	bh=JfthFi9LhRyByMOHUEzQs5sX2OPhUfj3Aw0t+4odLDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hYLw3DO9qO3mD30944Tp1/Xb6g0EhB/7dCr5Av/qXf15TY5HZTv42r5fJoiQqAbA0ovlcNgfMh/pjKNDdBhVdx2EYlIUcLah5vYTC4UbWjebok3u/Eh/OMSFZ4D1Sw11vo3P5bdhiKm51XMuklcr+BAurjWeiH7Hq33IsLG6bV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jjdxspsb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718525437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mAAmtj5lMpFJWjI+yClY7qbPBddpp/h/D3VoQjVd8IM=;
	b=Jjdxspsbngl+O8JENeEkZACtRmK9DEg2ITIW8fHKAb14Ki9WrVJ1YJe0JsODDSUp28jeuZ
	6pzI0QWumnB964DjSH3LpruGgmMy3Xb912IgXG2Xmsxd8U1U/mSdTmEAFx60K6v+V7IKoU
	3TR92Lt3YsZCEfCwYzJTVlEPcFQ5CsU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-eG4JHt2qMBuVDGUaWdkOIw-1; Sun, 16 Jun 2024 04:10:33 -0400
X-MC-Unique: eG4JHt2qMBuVDGUaWdkOIw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a6f0fee1f49so185493666b.0
        for <ksummit@lists.linux.dev>; Sun, 16 Jun 2024 01:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718525432; x=1719130232;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mAAmtj5lMpFJWjI+yClY7qbPBddpp/h/D3VoQjVd8IM=;
        b=xPsPmm3Qfv/H0v6/H3ijc3PRaUEBIP2mnfRCLMIqQJPh6J4+WTdYs5UOKx53GAkd00
         MglPojbaKauv98KQsfdeHNdzE/DNBKUz3ySvwN5PQKCKmXDXVFT0abJMcnU473XYseYR
         g8KMnU0Ju3q7PpN0PHSnRv7yuHUgXVuyaeqz8zhFlM3hZc5NIN/3G27K5RLvBvy/Mc1C
         9oWcm1Hti5lvZ319szub0mxgTgYygY0bJyQLG171kwPNcH+bizQccx1RzoxZXTTr6oWr
         FOBk4Psa5C5cBVPTPNhi4/StreZoqOYAHAv20Wd2U55Re1mUFa3GIpthiVp296//WTrC
         5iJA==
X-Forwarded-Encrypted: i=1; AJvYcCXZ2UbV/skoYQPWKpvfy/SLHoi3LlJWxMfewSxC4ZfERS88mFXmUI/mBUpg4C4ZbiFGU1XWtKAtsTtAA4tPGdpmtCF0vg71yw==
X-Gm-Message-State: AOJu0Yxg1oOJQnVii+ZbAF9dAHUv/X/uptE2NM6lltLUGQQVDpu9GDIv
	nc8aYO7MgcxD1ptRM/ceU1A/r2u4q2wgKuI8VbZBcc+0qlAIjhPxW7nTRt44H+FCLcA3Da81xRQ
	8Kx7kuu2XKKaEP9khYWMzhWZTLS4hRKEK5xjFm4bwOssnX8LIopt7TzQ=
X-Received: by 2002:a17:907:d30d:b0:a6f:6f4a:b24d with SMTP id a640c23a62f3a-a6f6f4ab52dmr327254466b.27.1718525432465;
        Sun, 16 Jun 2024 01:10:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEErz80YDOzYYhjCp376vbN0ZofjC8pYx6+8uhfhb+/mCXPm8w8wirRB+4Nt7VVCvn+4nWOJw==
X-Received: by 2002:a17:907:d30d:b0:a6f:6f4a:b24d with SMTP id a640c23a62f3a-a6f6f4ab52dmr327252266b.27.1718525431959;
        Sun, 16 Jun 2024 01:10:31 -0700 (PDT)
Received: from [192.168.10.3] ([151.62.196.71])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a6f57552633sm378551466b.191.2024.06.16.01.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jun 2024 01:10:30 -0700 (PDT)
Message-ID: <70bce57a-22b5-482c-89fe-d9cd775294f3@redhat.com>
Date: Sun, 16 Jun 2024 10:10:25 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Michael Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin"
 <mst@redhat.com>, Takashi Iwai <tiwai@suse.de>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Jan Kara <jack@suse.cz>, Thorsten Leemhuis <linux@leemhuis.info>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat> <87plsjoax6.fsf@mail.lhotse>
 <CAHk-=wiD9du3fBHuLYzwUSdNgY+hxMZEWNZpqJXy-=wD2wafdg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <CAHk-=wiD9du3fBHuLYzwUSdNgY+hxMZEWNZpqJXy-=wD2wafdg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/16/24 03:13, Linus Torvalds wrote:
> And no, I'm not at all happy with the fact that apparently vhost and
> kvm has made it their thing.
> 
> Paolo, Michael, Takashi, please put useful links, not those braindead
> message id's in your commit messages.

Ok, ok.  Before lore existed, there was no service that I can remember 
that archived messages with a message-id in the URL.  So, for example 
Gmane links would be useless now, and patchwork links are not really 
something I'd trust for long-term archival either.

These days, it's mostly just that I have set am.message-id to true years 
ago; but since lore is managed by kernel.org, we can expect the URLs to 
be stable and the original reason to use Message-ID is obsolete.  Having 
learnt right now about the applypatch-msg git hook, I've stuck a

sed -i -e 's,^Message-ID: <\(.*\)>$,Link: https://lore.kernel.org/r/\1,' 
"$1"

in there which should do the trick.  I guess Michael and Takashi can do 
the same. :)


By the way, if you use Firefox, you can do the following two steps to 
install a search plugin that searches lore by Message-ID:

- first go to 
https://mycroftproject.com/install.html?id=121759&basename=lore_kernel_org&icontype=png&name=lore.kernel.org 
to install the search engine (an XML file, you can see it at 
https://mycroftproject.com/installos.php/121759/lore_kernel_org.xml).

- then go to about:preferences#search and add a search shortcut

On Chrome instead you can add https://lore.kernel.org/r/%s at 
chrome://settings/searchEngines.

(Apart from git commit messages, I use it also with the 
https://addons.thunderbird.net/en-us/thunderbird/addon/copy-message-id/ 
extension for Thunderbird).

Paolo


