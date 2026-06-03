Return-Path: <ksummit+bounces-2916-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RXEeMWnhH2rargAAu9opvQ
	(envelope-from <ksummit+bounces-2916-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Wed, 03 Jun 2026 10:10:17 +0200
X-Original-To: lists@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 578C46358B3
	for <lists@lfdr.de>; Wed, 03 Jun 2026 10:10:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="dv8b8lS/";
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2916-lists=lfdr.de@lists.linux.dev" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="ksummit+bounces-2916-lists=lfdr.de@lists.linux.dev";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C6EBB3017ADD
	for <lists@lfdr.de>; Wed,  3 Jun 2026 08:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A27CC403EA0;
	Wed,  3 Jun 2026 08:10:15 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA133955EA
	for <ksummit@lists.linux.dev>; Wed,  3 Jun 2026 08:10:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780474215; cv=none; b=puG3UvB3CpSZ15P3wFp45tFsgDND6qnvkv5ojKUszk0IufonctPlhdvddnAdTa9I7XfrTVRgIYyenvsrWhFGuHZmGl31cQA7YfmDfVYKfi1WueLlpl3d8f7EkBY73jeX5l8DLvweYSZvZMtt7fQsrJc+/jijVstLg1rP+7zD4nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780474215; c=relaxed/simple;
	bh=EaR+Vt5Zx4MGIwawS8ci6+vHYicx3gkERLgDXGDr+GQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VTiaqXywpqZbfGKBMTkRTezzGMGX1GHe6pRx7ugON+OmbZaYBTnIAsW57+O3KFv8nCzvcZJ4Vo9bpeGn0dmLg6qn3rJX3gapGMPp2QaTm8V8cwJzZEI6cRl6LIw937kJ8GCj+b4b46os/FvLV9MdNMl/aVJUQdnTPSABlFy/UWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dv8b8lS/; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490ac357c55so30417555e9.1
        for <ksummit@lists.linux.dev>; Wed, 03 Jun 2026 01:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780474212; x=1781079012; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ekf+rYa8JyH0+s+9GhewWYOQTPKruNMBTPOAPDYzwTc=;
        b=dv8b8lS/Vk52PUSXwpnYhequ7SbRBkZV95PL76Jt+PFcGwWAfhSS7Cfarrz7MpsSrZ
         b6O4YG3bocQubY2yyR2cyTaU5/1sHfWMnGH0Pi3TLtm74CqNZQrqCsmtYRFpcJgDzEvv
         VaMgWsllm8E4hrFTjG8WWSnvYzaVfWQwJBAZk7SZMFR+Xg5Uv0086NTWlZXWYJxQxC3p
         TS9oi0KHzWrlXXPE7fwH2h0BY9+KYuBpf9hGEBGlsEgPvl/nmZ/nf+TrWufFzpE92RHb
         YLSTxVm2FrOkiJ+iJrc8QLkkXMraKp5Y21DTGLwH6O5je4rt/F9dpBmB55+qcnFLJMBf
         ZagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780474212; x=1781079012;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekf+rYa8JyH0+s+9GhewWYOQTPKruNMBTPOAPDYzwTc=;
        b=TW80XyyaArdEnCHRrI+lot3zetDiR4VfLkZhbIQoPEjRE29sx1kUAnn0ykpPCSGKo4
         Y4uOz7uVTN8jtirocHzZy+OKOyuPIdf9ognBQN9zOOgF54dhtU5y9JyJeuPtG3BG2NBH
         TyPSOlAy3eas0kokCRIuSaqXD/NzOeoNfiWPERxZrlBeP3oTcPjzld9vOoi+ePXOfIDf
         z3FMvUE/U87oYVGKRUSb9GAjXn1TadJ/c6umH0nrmJUjrESAzUvo2ZV1yr2/hCKgzZxM
         oORrZv1x5kWzSJ+ur7wIvpSeVfta34H1FEJKR5u3y30erFT3wiuzfaAZQS622OkMLF8B
         ZCZw==
X-Gm-Message-State: AOJu0Yx83L2LGIsoevKLEQeC/7tZ3FAhqHjQ/MkZxPS5htor2N4fcwod
	cEUV8lBot37GNkIKRKxMSkw2R01l+g/WE1V8DrjKhWTNCVB5v1waZMotfuwxK4LvCfg=
X-Gm-Gg: Acq92OGNnDIl0jTWFZgLqr+XxfGEP6Cc74d4sRhXg5TRQ9NKaWwPUWWIH3Y5eScdw4i
	38ZBSqhgs6mx5wmpUN8Cvz4eWJ2VJxCVcVtPCmn9/SWW0lh5KOkON69YpgLLAT83IZVjB2mTIof
	sr0Gf6vBjxBfNu7bTCOA0DxyWfdNqwtsJdTahssRqt5sKdg0cawA1F8+oh3zTCJQf8LrqzFXpQz
	0ye5ISgXrn78R8fYaYC+q95WZvsgj1GXxcE/2iYskdDInB6G7csZFiB5vGALcQzIizOfXisGM1g
	XBY5o2tD8nX4Ll8rCFZw9C3mp695V51VOMKtZEx/VId+KWcJIyZHaUOcXXTXU7z7N5rZA+XiYsH
	wBv7dlKFKEcpmncbf0N3xmg63x21RAc7ZohffS0us4Sc6iOpdImshe7mXteMO6loHxvjuIq6rY8
	aVGC7No82UXWu+sXxrDj9XdVNG7Ir12aOTyldmlqzjZNd+x86rFFL+fj+DTC4ufz8en4wiZjqBc
	jngc95hqQhgnXdGwg==
X-Received: by 2002:a05:600c:4ec6:b0:490:b8e2:6380 with SMTP id 5b1f17b1804b1-490b8e264c9mr20567095e9.12.1780474211504;
        Wed, 03 Jun 2026 01:10:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:89a4:7a01:8197:db41? ([2a01:e0a:106d:1080:89a4:7a01:8197:db41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7a6efe0sm16927635e9.1.2026.06.03.01.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 01:10:11 -0700 (PDT)
Message-ID: <45bfff63-3584-4228-929d-38722f1c564b@linaro.org>
Date: Wed, 3 Jun 2026 10:10:10 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: DRM/panel: Bringing Linux DRM Display Panel support in the modern
 age
To: Linus Walleij <linusw@kernel.org>
Cc: ksummit@lists.linux.dev, Douglas Anderson <dianders@chromium.org>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <0fa2fb42-0714-49f7-ba43-22928e1dd488@linaro.org>
 <CAD++jLnM0VjQ-51MaW49y6-JukcOiV8aZeq2uHy-T+f8mPWOxg@mail.gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <CAD++jLnM0VjQ-51MaW49y6-JukcOiV8aZeq2uHy-T+f8mPWOxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-2916-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid,linaro.org:email,linaro.org:from_mime,linaro.org:replyto];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 578C46358B3

Hi,

On 5/26/26 11:30, Linus Walleij wrote:
> Hi Neil,
> 
> I support this topic. I have hesitated to sign up as panel maintainer mainly
> because I have too much other stuff to do.
> 
> One thing we need to discuss is the hostility or active disinterest of
> panel IC vendors to the Linux community, or maybe to all their customers.
> My general impression is that they rarely publish datasheets, and if so
> under NDA, and their idea of a driver is a bunch of opaque custom
> commands sent during panel start-up and other infliction points.

I agree, but on the Camera Sensor side they had the same issue and started
speaking directly to some vendors which actually accepted to provide docs
and even write sensors drivers themselv es.

> 
> Has there ever been a single kernel commit directly from a panel IC
> company such as Novatek, Ilitek, Samsung (their panel business unit,
> not Samsung mobile), etc?

Not that I'm aware of.

> 
> Do we have any indication that there is interest from the companies
> actually doing display controllers?

They mainly speak to panel makers so I don't think they really care.

> 
> My view of them is that they seem to be a bunch of company in
> Asia who are deeply suspicious of each other and just think their
> competitors will copy everything they do, but this may be prejudice
> from my side.

Yes, but if we could speak to the DDIC makers directly to support those
in a generic way, we could simply take the panel parameters from the ODM
which got them from the panel makers.

> 
> On Tue, May 26, 2026 at 9:41 AM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
> 
>> Furthermore, it fails to support advanced Display Driver IC (DDIC) features
>> that modern hardware heavily relies on, including:
>> - Standby and advanced power states
> 
> There are at least some standard DCS commands for this.
> 
>> - Advanced color management
> 
> For example panel-novatek-nt35510.c, my most ambitious driver:
> 
> /*
>   * These gamma correction values are 10bit tuples, so only bits 0 and 1 is
>   * ever used in the first byte. They form a positive and negative gamma
>   * correction curve for each color, values must be strictly higher for each
>   * step on the curve. As can be seen these default curves goes from 0x0001
>   * to 0x03FE.
>   */
> #define NT35510_GAMMA_POS_DEFAULT 0x00, 0x01, 0x00, 0x43, 0x00, \
>                  0x6B, 0x00, 0x87, 0x00, 0xA3, 0x00, 0xCE, 0x00, 0xF1, 0x01, \
> (...)
> #define NT35510_GAMMA_NEG_DEFAULT 0x00, 0x01, 0x00, 0x43, 0x00, \
>                  0x6B, 0x00, 0x87, 0x00, 0xA3, 0x00, 0xCE, 0x00, 0xF1, 0x01, \
> (...)
>          /**
>           * @gamma_corr_pos_r: Red gamma correction parameters, positive
>           */
>          u8 gamma_corr_pos_r[NT35510_P1_GAMMA_LEN];
>          /**
>           * @gamma_corr_pos_g: Green gamma correction parameters, positive
>           */
>          u8 gamma_corr_pos_g[NT35510_P1_GAMMA_LEN];
>          /**
>           * @gamma_corr_pos_b: Blue gamma correction parameters, positive
>           */
>          u8 gamma_corr_pos_b[NT35510_P1_GAMMA_LEN];
>          /**
>           * @gamma_corr_neg_r: Red gamma correction parameters, negative
>           */
>          u8 gamma_corr_neg_r[NT35510_P1_GAMMA_LEN];
>          /**
>           * @gamma_corr_neg_g: Green gamma correction parameters, negative
>           */
>          u8 gamma_corr_neg_g[NT35510_P1_GAMMA_LEN];
>          /**
>           * @gamma_corr_neg_b: Blue gamma correction parameters, negative
>           */
>          u8 gamma_corr_neg_b[NT35510_P1_GAMMA_LEN];
> 
> (...)
>          /* Default gamma correction values */
>          .gamma_corr_pos_r = { NT35510_GAMMA_POS_DEFAULT },
>          .gamma_corr_pos_g = { NT35510_GAMMA_POS_DEFAULT },
>          .gamma_corr_pos_b = { NT35510_GAMMA_POS_DEFAULT },
>          .gamma_corr_neg_r = { NT35510_GAMMA_NEG_DEFAULT },
>          .gamma_corr_neg_g = { NT35510_GAMMA_NEG_DEFAULT },
>          .gamma_corr_neg_b = { NT35510_GAMMA_NEG_DEFAULT },
> 
> I have added driver support for this based on the code drops from Novatek.
> 
> So what we want is being able to actually adjust these curves, like we
> do for professional monitors.
> 
> However without the datasheet how am I supposed to do anything with this?
> I can't just trial-and-error such stuff. Novatek need to back any attempts
> and provide feedback to do such stuff.

We also need to provide APIs for this over multiple DDICs, but what publicly have
is very limited and most of the commands are not documented and we can't
compare between multiple vendors and implement some generics helpers.

> 
> I guess adding gamma correction to the panel frameworks and using
> the existing infrastructure in DRM for this is our problem, but then we at
> least need to know what we are doing.
> 
>> - Dynamic rate switching
>> - Command mode self-refresh
>>
>> This lack of evolution has led to severe fragmentation between upstream
>> and vendor downstream trees for advanced devices support, creating a heavy
>> maintenance burden and making native hardware support incredibly difficult.
> 
> How do these vendor trees look?

I only have experience with Qualcomm and they have an ultra-generic driver
which can run any panel in the universe (spoiler: no) with some super complex
DT entries and support all those super complex self-refresh and dynamic
rate change.

> 
> I'm curious. What I expect is more blobs of random hex digits without
> explanation writing magic into the display IC and named do_the_stuff().
> But maybe there are actually some real first class citizens here with
> proper structured drivers and a datasheet to back the code up?

There's some stuff with the DDIC but some are in the DSI spec, but since
we can't any of them publicly it's hard to implement those stuff without
a vendor willing to implement all those features in the DSI host driver
first.

Thanks,
Neil

> 
> Yours,
> Linus Walleij


