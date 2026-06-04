Return-Path: <ksummit+bounces-2922-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Eb/LCRF5IWpKHAEAu9opvQ
	(envelope-from <ksummit+bounces-2922-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 04 Jun 2026 15:09:37 +0200
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2DA640324
	for <lists@lfdr.de>; Thu, 04 Jun 2026 15:09:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=Nu4BPUF7;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2922-lists=lfdr.de@lists.linux.dev" designates 172.105.105.114 as permitted sender) smtp.mailfrom="ksummit+bounces-2922-lists=lfdr.de@lists.linux.dev";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17689308A4F8
	for <lists@lfdr.de>; Thu,  4 Jun 2026 13:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C8147CC89;
	Thu,  4 Jun 2026 13:01:04 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398EF421F10
	for <ksummit@lists.linux.dev>; Thu,  4 Jun 2026 13:01:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780578063; cv=none; b=IGloBw/L8RR8Ihhw2CnLq9gM+J0UKa8Bk3Zurmv47cJmOA1UC5kO4OBPlGRQMOjxa2qiGEe+hRFZnatBxZcYMjZw7bi3OhsItdFC+Q5iW1yaZz83GcODs3yiQN9wilt23aGGboDbUWI2vKL7/T8Xs8l3ZrlDMGzq3S8hG33onBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780578063; c=relaxed/simple;
	bh=KTUMv3l/yBTT5QV/yWA3edzSfwm3+zEsNSr5uXm+BtI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=auwlSDGNAAX5yvWI3k4VoA4KGvZZg2dTLoqEtjYJDTsG5R3MlT2Bxa7ulYq1ykdhXXi6DnD5RJY0PvgyWABYuFH/o4cDqj142IPj93R1kbcS3CRPfxgZlF5BnxqwTQ15xTbArWoMYSS99nacwl87q1jdFzT1yt9Hbd95RrcGQR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nu4BPUF7; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso5677095e9.1
        for <ksummit@lists.linux.dev>; Thu, 04 Jun 2026 06:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780578061; x=1781182861; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5Ecmnt+IaQbsvtnpTo8Q45UuuC2hoV3JWEnQ0Eavao=;
        b=Nu4BPUF7Tt0fpa2LkcYD8L4rmeIGxDeVoepPSdPZePsaLQoryAoyiCyhjKu3bcAk7w
         dWvU6774jk03Y4SZgB9tW5hBc/dR3ShHPo3L+EtGxfUeCYOviawiH7MME9dCnsabZ6mJ
         4VPaJmT4DvlosCDiSqXr6McrAQipXMkB/rU0mxPb5vKF2n7r8oMipaMF5yyZwwHSic6Z
         cj7RzSPOe5P+kyq7mb945XBEiFVt1udGNoNUoK95AjozMI24QFxubCWNTjPTQbTXVu0J
         yZ2WonxPmi28v+Ucc+SSJ7hkuK9a5rmWywXTeRf9SsDC3nBrdAU3jfUIQnxJPWkfN+k1
         pKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780578061; x=1781182861;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r5Ecmnt+IaQbsvtnpTo8Q45UuuC2hoV3JWEnQ0Eavao=;
        b=muTTIYMFQbQhuXU1Pe0IZ963QP1Ze1vML309Hs3oMHOeN/ReQ8AqpSVlLJ04aE0eyB
         4iOZNRW2r/0FU+lA7nIz4A2ac+Duh6TN8ZwtFQ3LEU/W2B2yZna82yDr22NOdhIe4E8n
         6iTk2fUvUaQjrIvFcWOdfjiCktkwKtERgPmnl6mLjWi6yjAv4ocbsNqJKWmSHneanQB3
         kZyeWya/xW+3nXp6QvKzHXRQhLeVOaF8QvMqMGCcXhwWvEHKiBNt0wrzcYbS0TX/sk3D
         vK+RB1CiDFDEQazDMXn/zG6Tyf4soUHiflzjDG+aPwv71OtijL+O9Q0cJ7wBINa749yj
         JVNw==
X-Gm-Message-State: AOJu0YyY1wX5LbLXD++2gmLeyc47fccHlYHwH1YNMXk4L2IsnpEap3yp
	e6BtbEE2az4WUi98Vjv9aDFoOrdHZoLQfR+FSrOJHWyZTECpAkBIfEZSJERKD6SkuSQ=
X-Gm-Gg: Acq92OEyl+O5THM+WY3T9RuI8LMwE9gDkpKiHrBEGCmTOLOA8YWc34qpfqQrR/LIvBo
	mM3LyzF/XA/dnLTFcIjSOLAGQf6X6W6HMbhHdyv5rlKrJpl0aP9vQL9cH9x4xVrlYN5+vZSS1wn
	4L7QrLyR/k8uC6xd1rBFyAFVHVlLxJdflEtMURWTrK6Pm+U1jzuRv+BMvKrJ6tUOCNILvBoFF+p
	LcgkSPa+S+qZ1p0SzoUrfAP5wi23my9ED053WbGSPjxfFJA2AGBu71nfacJ59pDxNF6r5pq5SaB
	htlIil/T+CVTfv1srXGPw8sEj80pvKTZR0g1wJRmqXfiab507r7D+H4eYBtjfrNzgB4MOveoFDe
	Lw7MnSNeggKQXAzr0q/UOfagzpFPFXszau+4DePoaHQjfeRHEKQMUo/t1oDA21EAhEu8joq7Zmm
	hF0/WuggxpH4CI0P1OoDpYvJkRgdx0jECvS1bV19pThkZlS7jEYtgdNVqf53Egvrmlh25yb4up5
	hLUbm3B1EPGDHE=
X-Received: by 2002:a05:600c:638d:b0:489:2005:b36e with SMTP id 5b1f17b1804b1-490b5ecc90bmr139777115e9.19.1780578060571;
        Thu, 04 Jun 2026 06:01:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:dbd:100f:afd5:9221? ([2a01:e0a:106d:1080:dbd:100f:afd5:9221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c183asm72096595e9.6.2026.06.04.06.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 06:01:00 -0700 (PDT)
Message-ID: <8d0a958c-2eaa-470d-b81f-3a6c436b8a7f@linaro.org>
Date: Thu, 4 Jun 2026 15:00:59 +0200
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
To: Maxime Ripard <mripard@kernel.org>
Cc: ksummit@lists.linux.dev, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Linus Walleij <linus.walleij@linaro.org>
References: <0fa2fb42-0714-49f7-ba43-22928e1dd488@linaro.org>
 <20260604-grinning-determined-falcon-0e8b01@houat>
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
In-Reply-To: <20260604-grinning-determined-falcon-0e8b01@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-2922-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:from_mime,linaro.org:replyto];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA2DA640324

Hi,

On 6/4/26 14:52, Maxime Ripard wrote:
> Hi,
> 
> On Tue, May 26, 2026 at 09:41:18AM +0200, Neil Armstrong wrote:
>> Since the introduction of the first Samsung DSI panel, the Linux DRM panel
>> API has been a crucial piece of software for enabling displays across
>> diverse architectures, but it has not evolved alongside modern graphics stacks.
>> Currently, the API lacks atomic DRM API support and the ability to adapt
>> power setups during mode changes.
>> Furthermore, it fails to support advanced Display Driver IC (DDIC) features
>> that modern hardware heavily relies on, including:
>> - Standby and advanced power states
>> - Advanced color management
>> - Dynamic rate switching
>> - Command mode self-refresh
>>
>> This lack of evolution has led to severe fragmentation between
>> upstream and vendor downstream trees for advanced devices support,
>> creating a heavy maintenance burden and making native hardware support
>> incredibly difficult.
>>
>> The goal would be to outline these architectural limitations and
>> trigger a discussion on how to collaboratively modernize the panel
>> API. By standardizing advanced DDIC capabilities and fully embracing
>> the atomic DRM API, we hope to establish a unified path forward for
>> the entire Linux community.
> 
> I acknowledge it might sound a bit like "let's burn the whole thing to
> the ground", but what you just described sounds an awful lot like what
> the bridge API already does.

Precisely, but still panels are not like "connectors" where the actual display
panel is something managed by the display microcontroller firmware.

> 
> Let's acknowledge that drm_bridge isn't just about bridge anymore, make
> panels bridges, and we're done.

Yes, and no, those panel-bridges will still have a lot of common boilerplate
that lies in the panel API today, but those could be moved as helpers and remove
the panel API entirely. And this won't solve how we implement advanced features...

> 
> The main problem with panels imo is how obscure they are, and are pretty
> much fire-and-forget for panel vendors, so they have no incentive to
> spend time upstreaming.

As Linus, Doug and Dmitry replied already, this is our biggest issue and not
only Linux maintainers issues but also product makers like Open Linux phones
which can only discuss with panel makers and are unable to match the downstream
Android capabilities.

> 
> It really feels like a similar position compared to what HID was, and I
> wonder if doing a dumb bridge driver for panels with ebpf support so we
> can put all the panel quirks in userspace like HID-BPF would be the way
> forward.

I don't visualize this proposal, could you elaborate ?

But the goal for this proposal is to have a conversation and it seems it's
an interesting subject to discuss in person.

Thanks !
Neil

> 
> Maxime


