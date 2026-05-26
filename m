Return-Path: <ksummit+bounces-2913-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBwfIf1OFWpMUQcAu9opvQ
	(envelope-from <ksummit+bounces-2913-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Tue, 26 May 2026 09:42:53 +0200
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F01265D1D54
	for <lists@lfdr.de>; Tue, 26 May 2026 09:42:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C473C3019923
	for <lists@lfdr.de>; Tue, 26 May 2026 07:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0C83AC0D7;
	Tue, 26 May 2026 07:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nxnKSAD1"
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8403CBE6B
	for <ksummit@lists.linux.dev>; Tue, 26 May 2026 07:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781283; cv=none; b=jxgwtJgg1kCa/YGL1vqrmSGIyGvqOjv1AoCyYjcAKlt42lqWe0eem2BkLK5aW59UHvPLGSlQ68ef3Jf33JxnI/BWUsAtbwZR9Y7wdB2TbB5/m/O+4licbk58h83CBRbuSfDOSFBcjTetFWC784DxV/NZn1X1r2R8bPlnVI7kyBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781283; c=relaxed/simple;
	bh=TcHW2fmZdpqQPC4/yfN23L/D7bKnZmL5KNrI0Ay4jmo=;
	h=Message-ID:Date:MIME-Version:To:From:Cc:Subject:Content-Type; b=K6q8oQiI8Zu64bAs7+lsG15pC26xg1HDenPolh1b+EV1fP1/xo6lDEW2QgUYE1C/tywNGQDQCF21WDLCjMNU1eTY77JJn+XxhAnsJyyCa8YjZvOG6ZEp1YXDIsR8Yq21aupNTh5jBOQb6J+fHvq+YraXUn7wOjoZfF2GGFlbuxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nxnKSAD1; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4585a116a4aso8490694f8f.3
        for <ksummit@lists.linux.dev>; Tue, 26 May 2026 00:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779781280; x=1780386080; darn=lists.linux.dev;
        h=content-transfer-encoding:organization:autocrypt:subject:cc
         :content-language:from:reply-to:to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GAJTABl14UZSq0dt5QE7+J2IQHG9q3nLrKLLjA0KxpM=;
        b=nxnKSAD15XkqanjAMkEGJaj1Kda/Vf8gDj8stmk3X1GWK4ujzwuRUI+BRYwm6D0aTp
         dII+CAq5PpDFuODP9CCAVTlzivtrj16A3kNaDKG95NQLs4OmfvLU02k7Ue/hh9jJRTw0
         oZnpfbD5lS12Gu/brYs+TROs6+Q5TP41DPF6y1q/rMHh4jHIulpH4rFp8k6+GNMfYgeB
         cPeUte9/JbNEpLwwPVApcHIpBGftCmbQFCytDZTM2nQ9BG9ijR/thMvdJGDKnjG7gpFy
         Ypk1ZwRQTr1qgx3KOB4yGqW1fmPR9vClBTV8Xfck+vfRDqC82wW8s2Kljz7rVXDHGSZY
         djVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779781280; x=1780386080;
        h=content-transfer-encoding:organization:autocrypt:subject:cc
         :content-language:from:reply-to:to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAJTABl14UZSq0dt5QE7+J2IQHG9q3nLrKLLjA0KxpM=;
        b=sfoUvXXWXY/Xg+FBJFPdZUf8gDoOAEfBhF96TbTeS7+dRnfoX0Qau6nUU/cShsiq3t
         kRVGRLUfqwJzXoQ+i+S3rCycYgHQZSdTV/5kQMxOWEM2NPM0/5T/GjYD70fb0wiMC2kN
         0NKRxHCyCxe8n8o9zGgSyLkJ59Rr+vGjk0ewi927qPGtUV+Avg8OLI2rbuaHpDCruz2v
         rH9rr+p1sbffMW6Ji6wnAD/99b8u/yT2Xw9eGhtOOiSNeL7kvT41u7j3Or2dwP7fy/RB
         9q1hyZMm9Ett+lVOWWZUwqyaxfgRQSt6nPKo1MJfflcgpX2MuHwhiL3/jCPsnr+nn1hO
         ytDA==
X-Gm-Message-State: AOJu0YwAXWcs3uQwZo7TzOof2K+LFDRI3fz5wXIMNzA1rp41aMI4VP5M
	qYHgSG0upGOQokFWl79MJ1Ip2C4OM0Bw0YWsSaLrw8XZpMfUIJyZsZ3YCiOhNkN55CPUfpEkn/x
	/m25JcNA=
X-Gm-Gg: Acq92OE7HpfdBxZtH4JNJPpz15j/TTgUiP7kmyldoknfqMyxDuEou46v9ZqgG6tm6+S
	BwSX1ylrrNSrp6bfnFY0KiqP5bWMkHur7eFVM7cTh60pZly7OQyBUzz70Q/0cx6B3/XYJssPRrk
	iEYL77UI/deiBq/kpedu5rf/cVyDfBhsmV6vQ4wid47HOGlhv/trrVc5AmgXRifxtUPtp/l0XUn
	HZXC/LpE/2t5c2+ELgb/gWsRE/JcUBzcR8FHku1ecjk+lIhvbfzt/8gZ00iDX5+CWy/FZ2I1lXE
	wlsYhaIFpErSO3D0E+tZoNFA9VJIh/+qgLAZSohW1ZpmRPHLFFlb/ZZi1iPcEToHh2RH8QrUU46
	e3fnSWbODoTCVQqMR+IJErq4J/fBSeLa28NIzF2TX9KbrzoHZwQYW+a8yDz9kAkr330mfllRoxW
	neB2reRzDu6VhmWj/M7DlbBb3ps0tW9PYlV2W42loF8KCniwaHTl3NYbb0CPNDzzylSr7fEXZuq
	1ElMOcQCDW8tFYJ4w==
X-Received: by 2002:a05:600c:1c0a:b0:490:402f:324d with SMTP id 5b1f17b1804b1-490428e03admr282358995e9.29.1779781279689;
        Tue, 26 May 2026 00:41:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:aba9:2be3:1465:636a? ([2a01:e0a:106d:1080:aba9:2be3:1465:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904561f682sm326605975e9.13.2026.05.26.00.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:41:19 -0700 (PDT)
Message-ID: <0fa2fb42-0714-49f7-ba43-22928e1dd488@linaro.org>
Date: Tue, 26 May 2026 09:41:18 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: ksummit@lists.linux.dev
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Maxime Ripard
 <mripard@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Subject: DRM/panel: Bringing Linux DRM Display Panel support in the modern age
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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-2913-lists=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:replyto,linaro.org:url,linaro.org:email,linaro.org:mid,linaro.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: F01265D1D54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Since the introduction of the first Samsung DSI panel, the Linux DRM panel
API has been a crucial piece of software for enabling displays across
diverse architectures, but it has not evolved alongside modern graphics stacks.
Currently, the API lacks atomic DRM API support and the ability to adapt
power setups during mode changes.
Furthermore, it fails to support advanced Display Driver IC (DDIC) features
that modern hardware heavily relies on, including:
- Standby and advanced power states
- Advanced color management
- Dynamic rate switching
- Command mode self-refresh

This lack of evolution has led to severe fragmentation between upstream
and vendor downstream trees for advanced devices support, creating a heavy
maintenance burden and making native hardware support incredibly difficult.

The goal would be to outline these architectural limitations and trigger a
discussion on how to collaboratively modernize the panel API.
By standardizing advanced DDIC capabilities and fully embracing the atomic DRM API,
we hope to establish a unified path forward for the entire Linux community.

Submitting this via the Kernel Summit track as we don't have a separate DRM micro-conference this year.

Neil
-- 
Neil Armstrong <neil.armstrong@linaro.org>
Senior Kernel Engineer - Linaro
https://linaro.org/


