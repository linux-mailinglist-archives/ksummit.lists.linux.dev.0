Return-Path: <ksummit+bounces-1356-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C339135F3
	for <lists@lfdr.de>; Sat, 22 Jun 2024 22:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83D922844E9
	for <lists@lfdr.de>; Sat, 22 Jun 2024 20:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0D85A0F4;
	Sat, 22 Jun 2024 20:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mswYVvyq"
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4A91A286
	for <ksummit@lists.linux.dev>; Sat, 22 Jun 2024 20:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719087048; cv=none; b=F2knkfb5FZig+lRccAvu6dVDwBqG4oAJ7DptRB84YR/WGiGm67V8v00Q3IMj6mPJM+zWrjcQR1ncr5NPsVHo1fOhnGnfP3Wsf7E95kNYznjJOmxrLIvZOmC3iB7IAHKdb5IgG7P5YsViQi6VomTI34gI5F7IdqykFyJ7OkOLE/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719087048; c=relaxed/simple;
	bh=fwmdlWbIiXExgoJhGW10urHmbfOMiDt8yk/9TNg0xVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MpvxoywEvQPygPV0WEFF9skNix5fczViPr5yKcvS51+yzTogpgXYcmxkwZmb3W20HhwpyfR6R+YQ3dfyna6qGSRlqZQeB0BdXSsh1y7GGeCONVlFXmXO3PX5eyZ9tIabLFYSkHQFfdCWQ0t0Ng8PXAojj6fTIAXE3EejJVLCwnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mswYVvyq; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3d21b3da741so1657714b6e.2
        for <ksummit@lists.linux.dev>; Sat, 22 Jun 2024 13:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719087046; x=1719691846; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Cp87DnzZ8ubh+P4vugkHALA0amyLWY1eDfV3e8BFDc=;
        b=mswYVvyqsgmyS8iisPeO9XWWDbQq+hecjOyaPUueZg9vsuhNddvHKVmhrjYSeN0IK3
         tPVIBcPX4T6TJGd0vCLMSZcRQiFCbjttk2tY25zXV5W12bdMJqSNdSp0d5mJbvcxpId3
         BSnsGi6VGPCKaid6gc7+AKTx2r1gUY5THnCzJnk6Sx8XQt+Pmzb4T3a9gtn4yfjPMthD
         5x/2QyOWgD8xox1HmWZT875iZBLeQ813pIn2RnVAaeadZm+vSa2ZAqZwrVLENznT340o
         HUTiCL0vxHPtSrEat8bPqVdaiYgpQ2a8470Pjn6GGsYdUYSRmkVCfRNP98z1a/GKvWbO
         lQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719087046; x=1719691846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Cp87DnzZ8ubh+P4vugkHALA0amyLWY1eDfV3e8BFDc=;
        b=mvrbcJnyn9Otn2wksFnG1tOQF/zfkVcrv1VcU9KAl3tE/qHSMAiHYEvVJqZJmLt+MV
         6Fv0y0ZrFa3tFBmID4gazahcoFsLX5EWbAYTSjGPmyVkenZaXQjMBDRbk26nSYtgD76M
         46nUUpmyVs7hXGf7c1ym7LhYOHbcCoEMyTHG5L/EveDd1sZUyJpVgTbK8Zdo8pA1/NJu
         r0LtD0GR5sMGkGg86yoyYah2bk8trKxb0Rm4J7hLM3c1+tRFlwxF9BiS79SIAy8bTcQg
         4T4djYOegr0BmWDXeK74XuzXcRfGoT2yquhXVEEA5IbEXcqq+Cpzyz4Z7iLP7/dnn3DK
         uHqw==
X-Forwarded-Encrypted: i=1; AJvYcCWu08tmKJaTl0q0aYi8RgxPjMoW/AxBeArzPJWCLswFWcGv2zRrPXq08P+w6WCrdGq6F6un70E86wc/2hVSralqN4FX3AHU2Q==
X-Gm-Message-State: AOJu0YxRbMbshjqeiFhcVFTXUaeffuKDD4gXiHs3TtlY5auVx6+rhCai
	TtcVr6SGCqlLNd35zqlOMNYoyN1/e6HLcL3GTt5Yx/Jd9eugGwtZ
X-Google-Smtp-Source: AGHT+IE4IvNVJ2jnOFTUyi+tw9zD7x6mlnie3P5tbq7r4wwQymw1PqhvbVkDZd7gts09MtoxOns5cQ==
X-Received: by 2002:a05:6808:1a1e:b0:3d5:1bd8:ab17 with SMTP id 5614622812f47-3d5459b4aa5mr1034519b6e.27.1719087045248;
        Sat, 22 Jun 2024 13:10:45 -0700 (PDT)
Received: from ?IPV6:2603:8080:2300:de:3d70:f8:6869:93de? ([2603:8080:2300:de:3d70:f8:6869:93de])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d5344fa290sm810713b6e.14.2024.06.22.13.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 13:10:44 -0700 (PDT)
Message-ID: <28e229d9-253a-4c83-a0f8-09da8a9bf78d@gmail.com>
Date: Sat, 22 Jun 2024 15:10:43 -0500
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Documentation: best practices for using Link trailers
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, ksummit@lists.linux.dev
References: <20240618-docs-patch-msgid-link-v1-0-30555f3f5ad4@linuxfoundation.org>
 <20240618-docs-patch-msgid-link-v1-2-30555f3f5ad4@linuxfoundation.org>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20240618-docs-patch-msgid-link-v1-2-30555f3f5ad4@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/18/24 11:42, Konstantin Ryabitsev wrote:

> Based on multiple conversations, most recently on the ksummit mailing
> list [1], add some best practices for using the Link trailer, such as:
>
> - how to use markdown-like bracketed numbers in the commit message to
> indicate the corresponding link
> - when to use lore.kernel.org vs patch.msgid.link domains
>
> Cc: ksummit@lists.linux.dev
> Link: https://lore.kernel.org/20240617-arboreal-industrious-hedgehog-5b84ae@meerkat # [1]
> Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>


Nice! 

Acked-by: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>


> ---
>  Documentation/process/maintainer-tip.rst | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/process/maintainer-tip.rst b/Documentation/process/maintainer-tip.rst
> index 64739968afa6..57ffa553c21e 100644
> --- a/Documentation/process/maintainer-tip.rst
> +++ b/Documentation/process/maintainer-tip.rst
> @@ -375,14 +375,26 @@ following tag ordering scheme:
>     For referring to an email on LKML or other kernel mailing lists,
>     please use the lore.kernel.org redirector URL::
>  
> -     https://lore.kernel.org/r/email-message@id
> +     Link: https://lore.kernel.org/email-message@id
>  
> -   The kernel.org redirector is considered a stable URL, unlike other email
> -   archives.
> +   This URL should be used when referring to relevant mailing list
> +   resources, related patch sets, or other notable discussion threads.
> +   A convenient way to associate Link trailers with the accompanying
> +   message is to use markdown-like bracketed notation, for example::
>  
> -   Maintainers will add a Link tag referencing the email of the patch
> -   submission when they apply a patch to the tip tree. This tag is useful
> -   for later reference and is also used for commit notifications.
> +     A similar approach was attempted before as part of a different
> +     effort [1], but the initial implementation caused too many
> +     regressions [2], so it was backed out and reimplemented.
> +
> +     Link: https://lore.kernel.org/some-msgid@here # [1]
> +     Link: https://bugzilla.example.org/bug/12345  # [2]
> +
> +   When using the ``Link:`` trailer to indicate the provenance of the
> +   patch, you should use the dedicated ``patch.msgid.link`` domain. This
> +   makes it possible for automated tooling to establish which link leads
> +   to the original patch submission. For example::
> +
> +     Link: https://patch.msgid.link/patch-source-msgid@here
>  
>  Please do not use combined tags, e.g. ``Reported-and-tested-by``, as
>  they just complicate automated extraction of tags.


Thanks,
Carlos


