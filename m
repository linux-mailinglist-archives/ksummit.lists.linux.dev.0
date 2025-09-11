Return-Path: <ksummit+bounces-2334-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C25B52FA0
	for <lists@lfdr.de>; Thu, 11 Sep 2025 13:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD7603B1975
	for <lists@lfdr.de>; Thu, 11 Sep 2025 11:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F20313E23;
	Thu, 11 Sep 2025 11:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lvg46eJU"
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966D6313E07
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 11:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757588957; cv=none; b=CaIex4yc3qvVKT6x+YxBF3t4D29JGAJeLbUX24qlS2+jRAcJElIMQnZwVcILOs7Y6bTYg6L/yftasteJNNd42+GvKPUET1du4TLhqI6kwJoeO5BEbkeAS18PXWKtRRNBd1Cs92V0pmYxO0r64EJuTi5S9qK1r0BPJ63/0Oq0NTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757588957; c=relaxed/simple;
	bh=ysUf1asVrFq1McBbLhOfGMaYpvlXiWxivqKHaYC0KlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sBvyERtM0eIvbR9n1rzzFE6ewCfpZnrvw45OmJdaIv/3QJ7Hy3vH3kOqmoHpThGN3u4pbDBtqUh//3tEwE6gKn1EicAdtIcUiteSwHohRp2AzVilOpwO6I/e2YLf107C3Gy/2BNrq+N5XPWVUVrDjUknaICi4yFiPQHhZevPGmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lvg46eJU; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e96d8722c6eso330617276.3
        for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 04:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757588953; x=1758193753; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ysUf1asVrFq1McBbLhOfGMaYpvlXiWxivqKHaYC0KlI=;
        b=Lvg46eJUP8dLRiyFfRYQRY9nP1U9QWF5ld/xk68OEMKEXu7mUcsTqH66PxTCYTKHuo
         axRP8A0CAHozB94nCmz8ZHa79C5cQAVZDkhXPF2di6pUbUL14bRdX2yMDYKmvBFgi2Tx
         XYhSHNw8PdYpoV4cKjXrUoLdILoAHEQ0JnvEX6cqPVVbl4/4p+crYza2XnY7BecvPhnZ
         yEbzJqdJK6vbipAmfW7eTaorJtIBy6TAij8+V9PDopgdhDFd9YqIMx3mjWWeGPObgZwA
         GA/fkNQJ4baN24pqeT0ySesx/paHFePHpmvFj7b1I9lxpPB1DmVjxqE8Fu0jJXzRJBO1
         U1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757588953; x=1758193753;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ysUf1asVrFq1McBbLhOfGMaYpvlXiWxivqKHaYC0KlI=;
        b=NzpON3BJaDCT4wxTy2iuxu16ojxwl6VJbwqTRmKxaXaqkp304iTNz0DJlmpb24R0/3
         mQUM1tpEJuS3Umb8mElefwrIJZ1gqX8C14sdnK9V2Qvf/32i2Tut0H40QP/2gM/tuCap
         9zEip7fC46M2oc+Vfta/4gYt2MzUvHY6U30+pC7OR2823oLcGJR8qQWs1EsqdvcS2St6
         zf/KoR0oXt2qoZkZ3ACo9CVYZonvM8BogTRmc5HIquF1eSJ8k8lYPcNMOWUgla5NBATG
         uL3A4LKmv5Uud25tx5mEDLaX0aUXpVIuFF0+wpV8YOItxZsxOBm/9Fecj62aqLGOLNtp
         3Udw==
X-Gm-Message-State: AOJu0YwqkQDn7dzZiwDAVWsNSAcNAxY7a6asYpgKAjLcqrQHa+9Ckuz8
	d3cqe67qlTxUMs0pLIT7uQZYozqDgnq1pf//x4lqNz1nUE0F6OTqqQRgktz7NzoVIZWAKT5JgZN
	wP7Ge6/XH+8mmY79WCaBau8nFYkLNFJtsXsUk
X-Gm-Gg: ASbGnctlLfAWIyxpIXNWOz9quBE18PJ/mLN7kBs8bJBmf8MhdKxK9SdnHEoTxE1mB1E
	awZHPNTD/YJF5QfpDAFHUm7uEzexpBDb/1VzPU+SVs/7aTvKrOYMwXLzvGl8TC+ep2EPbsXWR5r
	sDZZrJ3Cad1G6o3MUoG0w5VTdL3/43xhu7iov185BGWxO+30fJ5EBzj6gbqABNwanClhNctQSFA
	8tZF2IRBFXG5IUjsx8=
X-Google-Smtp-Source: AGHT+IHU8Y7ZTecVIsHbGXc2yzhRJqtYvbw0EQoa27ClNDqnPQbk3JXlKmserSZ4pHI7Np4zToLDDI05DUDz1CzCJ4I=
X-Received: by 2002:a05:690c:d07:b0:72e:13d3:fdf5 with SMTP id
 00721157ae682-72e13d40dc0mr50031907b3.26.1757588953334; Thu, 11 Sep 2025
 04:09:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <fc612440-af2b-4799-97b0-d5631380f0be@intel.com>
 <1dcb569edd7f73f2df4019bf459fdcb35dcdf921.camel@linux.ibm.com> <DM3PR11MB86833A11AD52C01C9063FFE1E309A@DM3PR11MB8683.namprd11.prod.outlook.com>
In-Reply-To: <DM3PR11MB86833A11AD52C01C9063FFE1E309A@DM3PR11MB8683.namprd11.prod.outlook.com>
From: Konstantin Sinyuk <sinyuk@gmail.com>
Date: Thu, 11 Sep 2025 14:09:01 +0300
X-Gm-Features: AS18NWBtsULqRngxBX5NVfkZNTck6BZAbE8FrDXzCOxzTEupMyEpqPdIylxHn20
Message-ID: <CAPpb9ykq9=HWvhH_FuGWqVDF7uzDCi_-Ow4n1qbqCQ5oGDz1CQ@mail.gmail.com>
Subject: Re: FW: [TECH TOPIC] UALink driver upstreaming
To: zohar@linux.ibm.com
Cc: ksummit@lists.linux.dev, Konstantin Sinyuk <konstantin.sinyuk@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 11, 2025 at 08:12:45AM +0200, Mimi Zohar wrote:
> Hi Konstantin,
>
> It would be nice to have all the Linux Security Module (LSM) hooks in
> all the right places from the beginning for integrity (e.g. signature
> verification).

Hi Mimi,

Good idea, thanks for pointing that out. We'll ensure appropriate LSM
hooks are considered from the initial design.

Best Regards,
 Konstantin.

