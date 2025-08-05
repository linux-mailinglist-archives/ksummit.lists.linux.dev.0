Return-Path: <ksummit+bounces-2039-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FDDB1B7AE
	for <lists@lfdr.de>; Tue,  5 Aug 2025 17:39:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5671016BB47
	for <lists@lfdr.de>; Tue,  5 Aug 2025 15:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD274272E53;
	Tue,  5 Aug 2025 15:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="V6EBGJLg"
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580A14A28
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 15:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754408345; cv=none; b=HWMc6VpMSW8ElPepxvGJBWQtzWBXbJw0ooSfhp1bDDUEfdhOX/klmXc7etmfzFOPBaq9/XRSkY9uHB1TrlUP1W+fh+staLRppzI7hT6uaMMaEGve8sM7BFJYU1L7wSo19gJgvsgM7R/u/TldhWkKRuxV+LCHT9mhgYce2wZBIhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754408345; c=relaxed/simple;
	bh=7S1RJVt7U6gYhWQDe/T1uqTG8UMyPA/8Cbv2uH+hwz0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=pduYJj5GjSQI486rUx27O7CjnjccfbKKZ1UCzVNDzyRL7aSWj8iUF+N93Ah83aEp0L3/2HPOHKSRwVwlTXsbm0OSPmMgXq90A+0Q2FrG3hivI5rS5EHBca95rxHIMZ+RKGCQybfx5ODnpyFmK4MPN1L5A5+p14jU2oz633Xo7j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=V6EBGJLg; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4563cfac2d2so41582085e9.3
        for <ksummit@lists.linux.dev>; Tue, 05 Aug 2025 08:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754408341; x=1755013141; darn=lists.linux.dev;
        h=mime-version:message-id:subject:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2DsQ/vKaW6EqAq6qqt+UvSosFodeTj0ZsJf/6H/6HEg=;
        b=V6EBGJLgjVjtsC3yJxAhj8VEilfuac28n5brDTLrGmZcTwqQn5jpialo6U7AJBrNAj
         QMqPBWkflQjE2gf0WW7cfggfBSdLuhNF1f/37mJvQ3Ry5gXMU3yg3X6gRwWpqlXayEln
         HN5trQn4TG8PhRrLdL4kdX2oVVoiyGFfC/6pNgqEGcJ8A6aqp+U618dhpotCCo3pGu5M
         QIgld7ZJaOpnuL/L7PXiKH2fFZR8kfavmIf2Tj9SdOJ6Rcxr22I0NPMVIRQiTlR+RJ03
         FC6Wiw53DPDaWHOztGE+mDm9Oo8ZvHE+T3NiuhYGIKLXR/NFsBICXMYbbXkX5/AGNfsl
         3hVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754408341; x=1755013141;
        h=mime-version:message-id:subject:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2DsQ/vKaW6EqAq6qqt+UvSosFodeTj0ZsJf/6H/6HEg=;
        b=n+YVllhTqchr+eKQC56zVA8qEH1roik9nM4r+L0xU30DLbjxoQy+V72W+5IJnPHXv+
         SB/fUZ58cN7Nv6OKh7T1XQRVu34u0KjPHR/2maecLmc3W2czm6IBE5wjMwer6dhgrFZE
         FJ7/MNg3djEm0wWCJBPdLnyQqGx59D0/o0LBNyZ1s6MeHoUZr0n12xo4MfMyDOS8X0ZP
         hRljvUph2pjxr9PZ2pv+cgwtbM/9RQoSvuPTz8CrOQYg4T3808+m3DtrLKAPQ/i069mj
         DE6FVqWTxsDFKfA0iCIdb8mO7C9T7S9Sbo0Y5lu5LCbcUD0HUBEAh2OliVpO/tR+jKiT
         ykGQ==
X-Gm-Message-State: AOJu0Yx7TtdX6uJx3/ETxIfhjsVwxoU41bBUGzNqylTERfQVI3FFEbxn
	MqVOR/paZBIIoTWl7Yg33th9O893SCXBiNsjNFON/dL33p3j5S9yWXz9HTnTRoLV4PEspYcXaDV
	gCZrR
X-Gm-Gg: ASbGncs5u+35jo7FqXSfuPfS1928k623TB+hyAbcklOiO2NkE9esC9zyvaRg2h1VF+B
	BTzmb7qHsNNFFyua7aoBNOUcs4lFaCDydcUxTvFwwuwSGG2v7TeJKQ2ihNbjPbkjGXlbmCBTDbo
	C/o3yw8SrQbCfRA8E5Qm3iftZSEPwZ2zwEyDjxPrfD9Umyu2hom4gm3+Xrj1qM42xKs2OGG6p9Z
	7Vn6j+jZOh5fxqeLtQ53izXY8GVjk+/ZqYlY8heq7Xl05uPbPgbR+yyZX7bQmij56A7qWy3dBPP
	Hu+DeoseFhY6TO1vzYA5G8eEk5YLDMA5qPgIc1t0WEvf/GwtXzUFLtBxGwWSkKVG7aj6/hwJJgX
	k4w/LDANXaYgA1G2hqfUqd5w0V9v2IFShah9W6SWFwg==
X-Google-Smtp-Source: AGHT+IF6+rAR/6edz79nw+vX5o6JfGBtbcvKchYGxC6/jpGmg1a8JmTPyojTONDUi5deNw6fUs5jNg==
X-Received: by 2002:a05:6000:2285:b0:3b7:7c18:c72d with SMTP id ffacd0b85a97d-3b8d946453cmr9559143f8f.4.1754408341563;
        Tue, 05 Aug 2025 08:39:01 -0700 (PDT)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32161259a48sm533642a91.18.2025.08.05.08.38.59
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 08:39:01 -0700 (PDT)
Date: Tue, 5 Aug 2025 17:38:55 +0200 (CEST)
From: Jiri Kosina <jkosina@suse.com>
To: ksummit@lists.linux.dev
Subject: [MAINTAINERS SUMMIT] The amount of -stable emails
Message-ID: <162r47q9-rp56-67so-7032-2r1rn36p03n6@fhfr.pbz>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

This proposal is coming as a followup to the brief IRC discussion that 
happened a few months back.

The amount of e-mails that are coming (with maintainers directly CCed) as 
a result of patches being merged to -stable is so overwhelming that I am 
not sure that people are making any productive use of it whatsoever.

I am personally pretty much ignoring most of it, as (a) I wouldn't have 
time to do anything else otherwise (b) I don't have a sufficient 
motivation / time to invest effort into stable in the fist place.

I feel it'd be beneficial to discuss this, and (depending on the outcome) 
perhaps make it opt-in (or opt-out) at least, with people/subsystems 
having means how to be excluded from all that ... ?

Thanks,

-- 
Jiri Kosina
SUSE Labs

