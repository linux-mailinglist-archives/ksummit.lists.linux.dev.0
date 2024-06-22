Return-Path: <ksummit+bounces-1357-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D739135FE
	for <lists@lfdr.de>; Sat, 22 Jun 2024 22:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD250283231
	for <lists@lfdr.de>; Sat, 22 Jun 2024 20:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5CD5CDD0;
	Sat, 22 Jun 2024 20:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byuAQBAF"
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFA4208CA
	for <ksummit@lists.linux.dev>; Sat, 22 Jun 2024 20:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719087234; cv=none; b=aAuqHnQVgu8cHPM4lzxWxw3Bdzly4O9nZIRdyAGZzj2nx5s6+IgDeTfzUju0ZERsN/cxnWBGKUzqHd1Q3zV3hjuO/mhj4jSvQyiJ1mSa3Klh63DeS+g4vW0xIXNpfdUhO0GcmzpAOU6GWDlj8xSKpStLX32QBhjwjOX4ZgSOxUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719087234; c=relaxed/simple;
	bh=UA5oSXmahYbHYVBqtiUErdibO6xfe3AsD2W8aE4UE/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EwyA+IxHr3BJIuvmRUP0JnKjrzTzhxSxmDRtV4dqmN8PwqIZb22y9wn6KJ2NnIIajAHOCRlhGvZKuO30ygc4hH6RUJL6EJZ0ndb+wt3ROlLPd71Hf+jAxcPgMLullncMRC62dxOWzdVrd+Q07Gk/nsj5TLnWnYUx3DWyJO6FjVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=byuAQBAF; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-25c4d8ae511so1457925fac.2
        for <ksummit@lists.linux.dev>; Sat, 22 Jun 2024 13:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719087232; x=1719692032; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zn/Wpf9G2VUisiptebA9rcNNy8uBkLEZ47r5g9BcsXU=;
        b=byuAQBAFXi/FDQ74Z5HB2By/HMPFA57OWMgvI+iaFneMS2tujKqYMd/qBr9DuNVUGa
         8cUusuz1JC+G4mC623TbzVHjz5E6DKTuZnunvinK4OFAXbwQvQfXhcKgZU5G6ojkGJ9d
         /s1sxfje6cAozjlLpmivAD7ViORwFsmv0KosSrebdmQ/rgCRQUYJZFe0nXsIjCmCNJg9
         Tez1A1HRtafwyl6iP3BdkYbXFLTI3DGDPQJ5xs532kWE5OF5tiA/N9DCsrxuaxu1gcHN
         qPFWthaFxtCEHzMIe88nE0MEvi6WNrbqmCDOSizp/bQjcgzzUOd1+l4N7ZGKnpbzM7Gj
         irTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719087232; x=1719692032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zn/Wpf9G2VUisiptebA9rcNNy8uBkLEZ47r5g9BcsXU=;
        b=KKNE/5U/oodaiw6aHM09hQpCmrBLQp9k4tAWqrnpv9PxN8rAqEPxQ0vW/AFeuYsBi9
         /8LMuDCtLFi+vxsmn/KmMKVydBf1F7Qao05fkdse0ySbTSfxNflXvv6FS7OzDoyGTPAG
         D3/zK7R6ACEiYJ8A8FmU7o7lCAeeltV2bmclQa913QM+N/x+Z8S2cRypCL3lDelqEYSc
         B4Z550bCKgMQMoFngV6tDin1P7NcgVm1xRveREucNMTtcbW99X8YECiQe0W+Oe5YSxyI
         2NXIsA070ulDbpY5vKq8aq8UN7pSbm8F3kpvsc9KTZ3sKRkHVbGzDaWEVeJCmi2tiftV
         H3iA==
X-Forwarded-Encrypted: i=1; AJvYcCXHx0nKll1AQDGzYr3mkBSKvSMtfL69EQma/JUXV3LKC0sCFEOK7sPUH9AOWHzKsHy2IB9jYa3l35aixG+hlI2SKORlMFSYzg==
X-Gm-Message-State: AOJu0Yzx5cPCm04rorax1dcPvgJ0AD+rpanRdQJ4vejSv39NiBl7kpLt
	y35TtgFqBPBrpmBbUGDEwxgHn/61jwfDucCmg8cBGk1xmZY96H58
X-Google-Smtp-Source: AGHT+IGBCgKjNBRhA2BRCjBBWXP9wdDisTR4355ryTFD1XzZRjbL080L/5borOqqmPsLMQjCp0RJ2Q==
X-Received: by 2002:a05:6870:55c9:b0:24c:a8e6:34e7 with SMTP id 586e51a60fabf-25d06cd6cb8mr869723fac.26.1719087232560;
        Sat, 22 Jun 2024 13:13:52 -0700 (PDT)
Received: from ?IPV6:2603:8080:2300:de:3d70:f8:6869:93de? ([2603:8080:2300:de:3d70:f8:6869:93de])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25cd4bfe0absm1026662fac.47.2024.06.22.13.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 13:13:52 -0700 (PDT)
Message-ID: <d4b03f1b-b0e4-4375-a2d8-3ea87e91c16b@gmail.com>
Date: Sat, 22 Jun 2024 15:13:51 -0500
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Documentation: update information for mailing
 lists
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, ksummit@lists.linux.dev
References: <20240619-docs-patch-msgid-link-v2-0-72dd272bfe37@linuxfoundation.org>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20240619-docs-patch-msgid-link-v2-0-72dd272bfe37@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/19/24 13:24, Konstantin Ryabitsev wrote:

> There have been some important changes to the mailing lists hosted at
> kernel.org, most importantly that vger.kernel.org was migrated from
> majordomo+zmailer to mlmmj and is now being served from the unified
> mailing list platform called "subspace" [1].
>
> This series updates many links pointing at obsolete locations, but also
> makes the following changes:
>
> - drops the recommendation to use /r/ subpaths in lore.kernel.org links
> (it has been unnecessary for a number of years)
> - adds some detail on how to reference specific Link trailers from
> inside the commit message
>
> Some of these changes are the result of discussions on the ksummit
> mailing list [2].
>
> Link: https://subspace.kernel.org # [1]
> Link: https://lore.kernel.org/20240617-arboreal-industrious-hedgehog-5b84ae@meerkat/ # [2]
> Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> ---
> Changes in v2:
> - Minor wording changes to text and commit messages based on feedback.
> - Link to v1: https://lore.kernel.org/r/20240618-docs-patch-msgid-link-v1-0-30555f3f5ad4@linuxfoundation.org


I prefer 'origin'over 'provenance'as well. My Ack/R-b from version 1
still stands.

>
> ---
> Konstantin Ryabitsev (2):
>       Documentation: fix links to mailing list services
>       Documentation: best practices for using Link trailers
>
>  Documentation/process/2.Process.rst          |  8 ++++----
>  Documentation/process/howto.rst              | 10 +++++-----
>  Documentation/process/kernel-docs.rst        |  5 ++---
>  Documentation/process/maintainer-netdev.rst  |  5 ++---
>  Documentation/process/maintainer-tip.rst     | 30 ++++++++++++++++++++--------
>  Documentation/process/submitting-patches.rst | 15 +++++---------
>  6 files changed, 40 insertions(+), 33 deletions(-)
> ---
> base-commit: 6ba59ff4227927d3a8530fc2973b80e94b54d58f
> change-id: 20240618-docs-patch-msgid-link-6961045516e0
>
> Best regards,


Thanks,
Carlos


