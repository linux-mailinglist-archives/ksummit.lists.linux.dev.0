Return-Path: <ksummit+bounces-2917-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OlbpOM3iH2o4rwAAu9opvQ
	(envelope-from <ksummit+bounces-2917-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Wed, 03 Jun 2026 10:16:13 +0200
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 594B56359A7
	for <lists@lfdr.de>; Wed, 03 Jun 2026 10:16:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=EswPOMc2;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2917-lists=lfdr.de@lists.linux.dev" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="ksummit+bounces-2917-lists=lfdr.de@lists.linux.dev";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C25230237F9
	for <lists@lfdr.de>; Wed,  3 Jun 2026 08:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 754C0409128;
	Wed,  3 Jun 2026 08:15:19 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0828C2D839C
	for <ksummit@lists.linux.dev>; Wed,  3 Jun 2026 08:15:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780474517; cv=none; b=PJ1Z7QMkhuoIgAfYZT84B3cgAIDy3hL6sdWoVuyY8rTM4/sf0F9h2MvQjmHRa1lG2swY3oMxTrSWG9NR6gVMU9euWi6HuwHhIVb22w3gW27n7NjNUL+RKxmh2Vteyavz0MvAg4YwgMV5cOBKeXQb5r/HsTcsfLPzpiy2me09u8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780474517; c=relaxed/simple;
	bh=IUdj2S194wnp6qZZgSIiKCahCxD4K/rByHXgHOMz7fc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ohBpqyg/DiWaIjzBy0WCm0BgZehnGw4jtbtFW+cHlsyN+9i/59p3FU46f7wHXxfMHynexmkf7FyQ7yF9LnVsENZscImK8bDm8x+vOakgTZVBZFF5Pc0FM9CDVeFx6Gr+b7X187nAX8sCxLC8fmGhc2ULsUFdF+r5BazVcNhfrBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EswPOMc2; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4903f7a90d1so112842095e9.2
        for <ksummit@lists.linux.dev>; Wed, 03 Jun 2026 01:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780474513; x=1781079313; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgVSkSTGUD+r38+oMQbD8gV4D5tRuyy3fVoULsia3VI=;
        b=EswPOMc28buu/hrX/KyMRwHQhBY+yPT5/1fkXwS7qI2Ji1ZoHuRl6kwSwdY7yQsTHw
         vQFi755u/Aprzb834I75osS7SBavTlEYf9MZ/VY1g7OKrhXbRpDvXzf3HzbThnbFKaHu
         0SAXbb7/L//PwZCGweE0RwX/RNoWcUe/DdpNfAWUtwmEBwncXU19GGJedjE53BXyUSO/
         9aYDsuCEwwLlkZF5X07H0wc69JMoCgXmLbjf+PMD1rXylBuIOs3ma69FtsiOCocJb/W/
         NM9n2klQiuFYKujVF4uiKsyQj0ch+ojUUJ7QFs1Tk2ihBfhfEPXuAxJa8jVsXz7sLx60
         /6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780474513; x=1781079313;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgVSkSTGUD+r38+oMQbD8gV4D5tRuyy3fVoULsia3VI=;
        b=SGoqHf++ltfOhHUiq4nm3etdb5vHH5Vewr7PtQN2hhNWsDamtUdPa3W0IyLq3EtNYj
         plecRW690K5APOrtwXBKgKx2g637ekFjFP6dgLfVOgbNyS7y6xBUiK5IV89TxC3AiFiU
         Z7SVc0uDSdFb3oDvEHmClf7zUsCU0VY9TWUTV2P37KZTy7j6h/w7XEbHIQdDAYCcWDCy
         fPBwKtbpkwkPobESSMnuodHuaUIQMN+kP1s/PX9oqQ8zoGnmm96Sxaipu3ksGUHgeFyW
         kZgSon7+2qYESUWdDj/SRCVLp8n00OMyLP+Gw1MKJuPuLS5hqq8qtcFOof4+8ErBLpYz
         7PDw==
X-Gm-Message-State: AOJu0Yzj+Mg2sqlTSYJ227uhiXhxpEm+hGFYMGkRA2ZkjJtpuMV0W7Q1
	Hry7wsS+XZ0XICHahhZMOChz2XUWl6f2RgtNklvS/Emf7F0yLEbcER3V24PAN5v2WeQ=
X-Gm-Gg: Acq92OEUglH8jy4uBDc3RjWARmZcLLdmkHzy4SM6oJgRY9kkKwIESh28PuoVrl1A35T
	6LAewqg3pwR99kVVMlo17DfYnpnVJiLCwf95TzmjWs58IxbnSVY0R0xPETPMgZ3iw0/xgD7OHkW
	iOEG/3zJWySsWbRYn6xW5Ti4DnJiOfovauYdLK6qMyI6toT6epImrPaCk+VyQCHuPT61lF7q6rG
	lT8fDKn6R5hQoECBD1Vlurma/3cdAzXtpdpTitAwOcC9aHTE+IlS2l7N2dYr0vRLmeK/EH7xXko
	lANInSLJ1M+v2RuXP0fzIpN8xWdjWMF9hwq/2xiHlHtuh0UYo5hUYK4oTzyK1BSevA45hynTbY3
	jfHZZRwne7fIZztEr5xivMEHuElsgnKsbV1/SWG6lUjJR/XqyS36S/au8RIWRhZ0TzqYRWj+yso
	mjRxH/CyHzbcY+rJQgtmZy7gRZWjT1O/ywAuErVo0nzD3PdVJ1r6qpaVsFQvGSv0u2ud0tjYMD3
	3v3GQTaOGv5e7Po1a/Mf1SVOouI
X-Received: by 2002:a05:600c:5247:b0:48f:e245:394e with SMTP id 5b1f17b1804b1-490b60f6453mr37619675e9.27.1780474512984;
        Wed, 03 Jun 2026 01:15:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:89a4:7a01:8197:db41? ([2a01:e0a:106d:1080:89a4:7a01:8197:db41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc577sm5302561f8f.3.2026.06.03.01.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 01:15:12 -0700 (PDT)
Message-ID: <58b8d756-ce59-48d1-82d8-1bd2d1b0ec4f@linaro.org>
Date: Wed, 3 Jun 2026 10:15:11 +0200
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
To: Doug Anderson <dianders@chromium.org>, Linus Walleij <linusw@kernel.org>
Cc: ksummit@lists.linux.dev, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
References: <0fa2fb42-0714-49f7-ba43-22928e1dd488@linaro.org>
 <CAD++jLnM0VjQ-51MaW49y6-JukcOiV8aZeq2uHy-T+f8mPWOxg@mail.gmail.com>
 <CAD=FV=VCpr6eUSN7=MF4ud=JxhUPwZJUgEMZJBz0wcF=LQNuvQ@mail.gmail.com>
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
In-Reply-To: <CAD=FV=VCpr6eUSN7=MF4ud=JxhUPwZJUgEMZJBz0wcF=LQNuvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	URIBL_MULTI_FAIL(0.00)[linaro.org:server fail,lists.linux.dev:server fail,tor.lore.kernel.org:server fail];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-2917-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:from_mime,linaro.org:replyto,lists.linux.dev:from_smtp];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 594B56359A7

On 6/3/26 02:58, Doug Anderson wrote:
> Hi,
> 
> On Tue, May 26, 2026 at 2:30 AM Linus Walleij <linusw@kernel.org> wrote:
>>
>> Hi Neil,
>>
>> I support this topic. I have hesitated to sign up as panel maintainer mainly
>> because I have too much other stuff to do.
> 
> At the moment, my day job has taken me further away from interacting
> with panels, but I'm still interested in the topic for sure. ;-)
> 
> 
>> One thing we need to discuss is the hostility or active disinterest of
>> panel IC vendors to the Linux community, or maybe to all their customers.
>> My general impression is that they rarely publish datasheets, and if so
>> under NDA, and their idea of a driver is a bunch of opaque custom
>> commands sent during panel start-up and other infliction points.
>>
>> Has there ever been a single kernel commit directly from a panel IC
>> company such as Novatek, Ilitek, Samsung (their panel business unit,
>> not Samsung mobile), etc?
> 
> I share Linus's sentiments here. I've only interacted with panel
> manufacturers by proxy: I've interacted with ODMs who then interacted
> with panel vendors. I've always been a bit shocked by the "sequence of
> opaque hex commands" and would love to see something better if we can
> figure out a way to improve it.
> 
> 
>>> This lack of evolution has led to severe fragmentation between upstream
>>> and vendor downstream trees for advanced devices support, creating a heavy
>>> maintenance burden and making native hardware support incredibly difficult.
>>
>> How do these vendor trees look?
>>
>> I'm curious. What I expect is more blobs of random hex digits without
>> explanation writing magic into the display IC and named do_the_stuff().
>> But maybe there are actually some real first class citizens here with
>> proper structured drivers and a datasheet to back the code up?
> 
> The only drivers I have experience with (other than ones I've
> performed random cleanups on) were ones that were part of Chromebooks,
> and there were no downstream trees there. Are there example vendor
> drivers you can point to? My first instinct would be for someone to
> take one of the vendor drivers with advanced features and start trying
> to upstream it. It would be even better to look at two (or three)
> different vendor drivers that all tried to add the same type of
> feature, but that might be asking too much.

We lack advanced support in DSI host driver aswell...

> 
> ...but if that's a bunch of hex blobs, then maybe that doesn't help us
> much. To make progress, we'd need to find someone making a product
> that cares enough about upstream drivers that they will put pressure
> on a panel vendor. Unfortunately, ChromeOS mostly focused on eDP
> panels, with a few cheap MIPI panels here and there. ...and Android's
> GKI tends to discourage people from upstreaming driver code...

We need the whole chain cooperating: SoC, panel, DDIC, Product

The most advanced panel I know is the visionox-vtdr6130 which I upstreamed
for the SM8550/SM8650 HDK/QRD which supports Video & Command modes +
optional DSC + dynamic rate switching + self refresh in command mode.

But I don't know which DDIC is inside...

Neil

> 
> -Doug


