Return-Path: <ksummit+bounces-2646-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFE7C85C88
	for <lists@lfdr.de>; Tue, 25 Nov 2025 16:32:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 219B34E1CE2
	for <lists@lfdr.de>; Tue, 25 Nov 2025 15:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E5E31C57B;
	Tue, 25 Nov 2025 15:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b="vBIPnK7i"
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CA314B96E
	for <ksummit@lists.linux.dev>; Tue, 25 Nov 2025 15:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764084749; cv=none; b=MWd15j6YR7bcl5ZOeaKxgJxzUY7mlQlN3tkHXQ4Z9d/sDsgA30n2DiqdJLkKdAoIYHw1sav9mNwKeFQlxk+4G8y/P5U4TtG1d7JT4nPLObUMPlrosrsEA9egLptGlkGYln8+5tlzXUTUb+xNBcTYtz0IiKN5xr/IJ8Kla8Ow71Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764084749; c=relaxed/simple;
	bh=MoTnXX/JDMIlor/GGBh7GqAbbA2mFgxeg5HWI/Krl7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i8WWOBRyM+dFEhH/cF9d3IjIEULn0s678lRHCGfCzg34Zmjfi2/YE9yThq33ZaMyXrP2592ykQdfT8Rl3twCeSHKAqOqeUMc5htZbU/Wt8sg/IrSBkKzGhAtm46F+rkExao4IxIyd75bFfQ/fCY71GVkKYkb6UA73x4hPtlqSeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org; spf=pass smtp.mailfrom=networkplumber.org; dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b=vBIPnK7i; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7a435a3fc57so5943543b3a.1
        for <ksummit@lists.linux.dev>; Tue, 25 Nov 2025 07:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20230601.gappssmtp.com; s=20230601; t=1764084747; x=1764689547; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNI+MRfplprIGgM8wV4MohxouRr1kUJAd5B82/krB3U=;
        b=vBIPnK7i1HP9gfC9Ou/9q+ptEd0B4ySkEy29agOYyzSgvqT/JzAyWTGSE0XR502u3G
         mTxEIik8NCycI4FoUnZd5YvSTEMla2wdFenuvydeyI5Smnz/zMoTM/4F5JxvA3L9WCya
         J5yKhC97IxSjYf9MnMtm/e8Xjv4iUt+2V42Gs+iZf7F4ZmniFzdezGKWaCsE6/PsQ+fr
         TvH6EjwR7/rQLgKa7RQ760+Aaq94n6qsy7AQ9HfJ2pLd9JxHtl+YTiDx5ev9qrSCehNx
         3qS+Ws4UfFSCdsUtClwE5QfLJjWGpzrXbJ406y//902HwkovDs4IkyqbA2oIVsAvk0ZO
         uSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764084747; x=1764689547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bNI+MRfplprIGgM8wV4MohxouRr1kUJAd5B82/krB3U=;
        b=V37rXLX7wMZlwHO+9j5uVDSWLusB17EYHhPh2eRDKzhAsD4eiD7CzSrG3Rc3m/kNdO
         oggVKT+k39G6xAKNvJaTaDBRrbkfR7ppotFZHybI7qgytwlKMF4bikixDmo07WdDi8gm
         lBuae7IxipBoX+5H7IqrbnK/oiZ6jATCH0tu4x/p06hA+vSiGUEiyqQxPNjN6XCHsLiC
         Vp4jGj7KATd9WNeTH9Y84QpZjZZdrpKdGihqr+2Y6tO7BRrAnP6ycU9yUJgOm6c12WmA
         FJBPl9XCZQgUEfTFnEAgspA2w8abKj2TUjx6O0196vXpo+kh0eYLTpM79OB69XznIcPL
         vwyw==
X-Forwarded-Encrypted: i=1; AJvYcCXXS4UABjvk4BsdPvsymD+BFGaj0FlMopjPIrhknjprkZVKLRt+DvLGwQm3d/BZST2FAuXuKYYh@lists.linux.dev
X-Gm-Message-State: AOJu0YxWZal1vtyzZps40Ig5/83vDLZf9U/UIGHxOtFvTWduDo+hXz7G
	UWbYKSVZ9AETbgftBAeEx1b+NHCSfyaotVo6pWJCTKT12fS1YzI5pk5ACurxj4DqogbaZLmj9Po
	yx7B1
X-Gm-Gg: ASbGnctASxYcdpRjgEisjAD3owaHSrrxuAJlP1/GYnv/UMd/3tweyCJcBd4STXJn/+h
	qohH8RhcWZ+nSpgAdbrJfE7rLPJt59MiYbAiiUdvW7ez7uDBgzFzrQWK1DMp82SOSt+W+PD2et4
	2vVOQWrtvu9IxjecS7ij8fvPwiqV3737/nHrskf0RAILr5zfL1aTyfaqse2tZ/WQANop+J+Fmwe
	YIprhWC3EROymtQ9yoIxy6WtlvXzDmb/GK5fvNGkCvwm55fg+YAuEJX3J9uCpQxUKu+rC0Mcogr
	hCIenUFNnT8LHur/us3Nyv2DX1xLO5uPYjIkNJWNDgsE73bHiCG6NohLHO6kkV6eglrNfuKefpk
	d/JK8e0vvK9p2z492js1Re5BsLL8pqd0uOZxv3+SqGOsRDP02RnWZDHjP/QWox/hixlIZyyU/Jy
	T0ke2WX40ZhiI6fzihjr0sfyqR48IQyGrDxtlSRRHuqF/80Iv2orn4
X-Google-Smtp-Source: AGHT+IEH5KxLMz8SWWrMvmdiASziqo/J4NeMjt5LMvuEyUhOQbJB7R6NspG3eGOAcfguGzT3y//iPA==
X-Received: by 2002:a05:6a20:2589:b0:341:d5f3:f1ac with SMTP id adf61e73a8af0-3614edd7ee7mr18164019637.41.1764084747054;
        Tue, 25 Nov 2025 07:32:27 -0800 (PST)
Received: from phoenix.local (204-195-96-226.wavecable.com. [204.195.96.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f024b4aesm18276206b3a.33.2025.11.25.07.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 07:32:26 -0800 (PST)
Date: Tue, 25 Nov 2025 07:32:24 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
 ksummit@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Dan Carpenter
 <dan.carpenter@linaro.org>
Subject: Re: Clarifying confusion of our variable placement rules caused by
 cleanup.h
Message-ID: <20251125073224.30e24755@phoenix.local>
In-Reply-To: <7b37e1cb-271e-49fe-a3ee-5443006284e1@p183>
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
	<7b37e1cb-271e-49fe-a3ee-5443006284e1@p183>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 Nov 2025 17:25:19 +0300
Alexey Dobriyan <adobriyan@gmail.com> wrote:

> On Tue, Nov 18, 2025 at 11:39:26AM -0500, James Bottomley wrote:
> 
> > So which should we do?  
> 
> The best way to understand that C89 style of declaring in the beginning
> of the function is pointless rule is to write some code in a language
> which doesn't enforce it. You should see that nothing bad happens.
> 
> It increases bug rate due to increased variable scope allowing typos.
> 
> It bloats LOC -- in many cases declaration and initializer can fit
> into a single line.
> 
> It prevents adding "const" qualifier if necessary.
> 
> Pressing PageUp and PageDown when adding new variable is pointless
> busywork and distracts, breaks the tempo(flow?) so to speak.
> 
> C89 style provokes substyles(!) which makes adding new variables even
> more obnoxious: some subsystems have(had?) a rule saying that declarations
> (with initializers) must be sorted by length, so not only programmer has
> to PageUp to the beginning of the block, but then aim carefully and
> insert new declaration.
> 
> None of this is necessary (or possible) if the rule says "declare as low
> as possible".
> 
> There was variation of this type of nonsense with headers (not only it has
> to be sorted alphabetically but by length too!)
> 
> There is no practical difference between code and declarations:
> declarations can have initializers which can be arbitrary complex,
> just like "real" code. So the only difference is superficial.
> 
> 
> C89 declaration style is pointless and dumb, no wonder other programming
> languages dumped it (or never had), it should be simply discarded.
> 
> It will also make Linux slightly less white crow to newcomers
> (C++ doesn't have this rule after all).
> 

Agree with everything you said.
But I don't want to see patches that are just to rearrange existing
code to move declarations around. So yes, but no more churn please.

