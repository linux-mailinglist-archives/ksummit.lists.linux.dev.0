Return-Path: <ksummit+bounces-2645-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62954C8567E
	for <lists@lfdr.de>; Tue, 25 Nov 2025 15:25:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 468D83A799A
	for <lists@lfdr.de>; Tue, 25 Nov 2025 14:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503CC3254B8;
	Tue, 25 Nov 2025 14:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPTXgR2r"
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382213246F0
	for <ksummit@lists.linux.dev>; Tue, 25 Nov 2025 14:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764080716; cv=none; b=hkDwWUCTo1E6j6KFqrAsVsb6D3ZeGM+xLw36Z69NCFNtKX3o0kVCsxcpWyQYN7GLFP9Z/ep7M9PrWNYZzk6Dh+Fh0fQB8sOG+q78b31H7JEJhKK8qqhm1BdYK1391x5dBJIyT5/LINt9I82QPU2HylcTutdzmkoPJEnjdQ2sctw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764080716; c=relaxed/simple;
	bh=VidrQjP8cQNVecrbUgAZAPFFcr4TkXgMPISPirxbN0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aVJcl/qXHU7DVxtxF+X2r1GfiGOEw9yLN3Wn32qrjH7EAO5xXvARHe0O3CWgTeGTZr/PsFqZQb9zQM4JTvnykgHEa0xk5XfBpUs6jRSWsAKTNURjdTpwQ7Yrr9GvTe3pvf2dJG1RhN5DGdI/kbMjVHOCnDs2vwrEdO/SUCxgUVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPTXgR2r; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5958187fa55so4290750e87.3
        for <ksummit@lists.linux.dev>; Tue, 25 Nov 2025 06:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764080713; x=1764685513; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VidrQjP8cQNVecrbUgAZAPFFcr4TkXgMPISPirxbN0c=;
        b=HPTXgR2r/SNrKRCHbD/7ZC4jOTef79Mf5J/3YXUQlsSp9199xOJYpsfjrOV2/VJSp4
         KT9UBlT+ewMMxEM5xtEou9L3HlzofujG7kXZ7Qijp6PnHMPOwsHUGbT5//Ej69CzxxP9
         Ty5nZFLyGZFvplpLZFduKHXET3hgQBpIKIxe66GCWKIxr695fJE41TqcUoZ/+MR2Migy
         s6YHsz/QF4kQlnRvC5j+xIy3ZC6Rfan+9bKQHLm7Cq95vNbE8y/g6LA8G6OJS3gRErSE
         p3Juun0X2LaK8RaJW2XNIi1ndimFdy4UYVteYBMlES1wzkcd/4M1We4GQ9q0K8lFaiXj
         9IXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764080713; x=1764685513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VidrQjP8cQNVecrbUgAZAPFFcr4TkXgMPISPirxbN0c=;
        b=utYO1YF8ZBjkd9Tnw0pGCrmbT443vhvyiGa5nMLgKIOwXxsDKCtLseGG6ibKckSfN+
         26PZQKK2A4rUHhAP/rNSnVlWQvakPcAIGw/evNIi5dZ11ZBxwIRO4/Nf+7CGb1DV36rR
         P+EORPzfqPDeFaAUBbTpE3N5FGd4sRfUR8tlORMuHmAW3saTj5rw7JyLNwx4KP9ZchGh
         bej47uO2BSrP6U8nq0dVhnbkmzQ3L7fVeeHSc9kt+nFn3/G/l7Y0G6J+l0H4lWtRPvaq
         1YU7m6FHbOt0jToqwk1521NbeyTR/oC9iejd3AFV+yLSLhZHiseo5husuKoJRa1te1Ep
         l9pA==
X-Gm-Message-State: AOJu0Yx5dIZ0gaKl/5JZmROWtnep/kz9u1Ueo2VltqYE/qK2+u/WgN8q
	qbkPCw7DHOmt40y2fy3yESLD9iNZoJSxJbB+Owd0pbwlEJJsdTjFK1M=
X-Gm-Gg: ASbGncuazzdLBCC0D9mUwxUsEZ8JKKvtzmSVD/u82pb2SMHiIczuXcWQjtCta9Myn3b
	9AnnABGfznihV6i9UJoz7KmAbGORE/9G+tRYU/PP73tkQTUPqU3w0H8xnGB87RbJVmvqzfHADZq
	2/BokvuqaTOKfpERrn+KbvdcPHuchr8Mg/Pqr9rSODQ2Jwnn+7qYoIN4zkUHhAfUK1Wc1T3TD/u
	9PcrmFyWEdwMohymj/mFyEa+PX7VkJRWqOM8nDKcxUvchYQe8lRNCQ4gJAIRDnz+3Z8zxL0krXz
	WKCSLd61EYcUGRqksRiE/XBsVArss0JxQNCCqa4Ut34ZgtgFswOzqmgUSt/rRA7GLByCqNdxuKH
	FE8rId0bWcQxnEZlBRbjWg7hHGyvYWRvr9WLm5I+7tGBFsdYUd1rRyJs4cETxFrb9xlHYzEgI
X-Google-Smtp-Source: AGHT+IGxUh40YvI7RHhj6BGgFqnWbHjR95ygR8U26ZGznWuhnn4R5jSRdozHdB2YbcanGF7xt8wiFA==
X-Received: by 2002:a05:6512:239e:b0:595:7fa2:acd with SMTP id 2adb3069b0e04-596b5046a9cmr1389512e87.21.1764080713051;
        Tue, 25 Nov 2025 06:25:13 -0800 (PST)
Received: from p183 ([46.53.248.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbc5e07sm5164295e87.83.2025.11.25.06.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 06:25:12 -0800 (PST)
Date: Tue, 25 Nov 2025 17:25:19 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: ksummit@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: Clarifying confusion of our variable placement rules caused by
 cleanup.h
Message-ID: <7b37e1cb-271e-49fe-a3ee-5443006284e1@p183>
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>

On Tue, Nov 18, 2025 at 11:39:26AM -0500, James Bottomley wrote:

> So which should we do?

The best way to understand that C89 style of declaring in the beginning
of the function is pointless rule is to write some code in a language
which doesn't enforce it. You should see that nothing bad happens.

It increases bug rate due to increased variable scope allowing typos.

It bloats LOC -- in many cases declaration and initializer can fit
into a single line.

It prevents adding "const" qualifier if necessary.

Pressing PageUp and PageDown when adding new variable is pointless
busywork and distracts, breaks the tempo(flow?) so to speak.

C89 style provokes substyles(!) which makes adding new variables even
more obnoxious: some subsystems have(had?) a rule saying that declarations
(with initializers) must be sorted by length, so not only programmer has
to PageUp to the beginning of the block, but then aim carefully and
insert new declaration.

None of this is necessary (or possible) if the rule says "declare as low
as possible".

There was variation of this type of nonsense with headers (not only it has
to be sorted alphabetically but by length too!)

There is no practical difference between code and declarations:
declarations can have initializers which can be arbitrary complex,
just like "real" code. So the only difference is superficial.


C89 declaration style is pointless and dumb, no wonder other programming
languages dumped it (or never had), it should be simply discarded.

It will also make Linux slightly less white crow to newcomers
(C++ doesn't have this rule after all).

