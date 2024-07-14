Return-Path: <ksummit+bounces-1406-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF95930C22
	for <lists@lfdr.de>; Mon, 15 Jul 2024 01:09:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E0781C20E09
	for <lists@lfdr.de>; Sun, 14 Jul 2024 23:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C15213D28C;
	Sun, 14 Jul 2024 23:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Mm02CIbf"
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE01215C0
	for <ksummit@lists.linux.dev>; Sun, 14 Jul 2024 23:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720998569; cv=none; b=TRAsW515xI8Bumum7mZ/2TRa5o3bjn4VfYRhb3EMXAa47Zqpn7ZlORrIkxe5zmjy/grJxdCQGvCEtevo2foBKca7bJIhcVXNz+yZivWRJ17cYkaekNa586SPG1c8YLysv5lOyg50L8xETqlC3TL8cl53pEp9pmaTodiEfUUV0mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720998569; c=relaxed/simple;
	bh=uTR3mPE81bOnx3HZEdtZAXzRHGpK4Q2y3kV07+cw3SQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e35cUxPeuipGBCyo7l5mrEndGHBuFWB9P5Nsg+3SibQFSpqBrfrMWVWcubLFXYvrJ78vcp4eRSt6tGBzyEbitGF5HJahqE+SU6TWlnLB0I9ejEgRzjFS0nYbMleOFxIrECEvNa2rROwja7lUQR/n0FOsgx/Bic0GTp1WekZQ0fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Mm02CIbf; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2eedeca1c79so18601861fa.3
        for <ksummit@lists.linux.dev>; Sun, 14 Jul 2024 16:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1720998565; x=1721603365; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u9DsJXHeIxS5aae00AFjJMwRMiGzZG0Dwh6DHTWZj/U=;
        b=Mm02CIbfuUEiVCzsiayV8bEK58EJTiabDqpVLhQ0a4gl7VqgN2ocMtWLpfWWr9uJ8x
         aP/fJi9yRxxjh4I9+N1TC2dRHVuchguUhGB+/djac+gfx26ZvgznX/IK2SgoO66KuGvZ
         Il2qFzxJrICntJThAEH4ylGE2bBY0dc/F/VB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720998565; x=1721603365;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u9DsJXHeIxS5aae00AFjJMwRMiGzZG0Dwh6DHTWZj/U=;
        b=Y79QT8lsncfNU63Py3SDaw/JHlr7EH57QP1MpSyCwOmJGeKSsnyibMqiSr+jyssx3h
         tAszK7UflZQqilZlPfEIwhEJr6oOtluBUEwuYxJQaxkHNVT45athAdsZEVWtm6zVXJ3p
         SP+oxrpPdPxwBWOzaGLHP6MfH3YGwEM0ic2F+02anlj2j2O1qlYqpd1PThj8TBRu6+GT
         ya+DEf6VtUG321Tt/RYrkBVMs92MKll2ULpHklvto7agXhSFhE+cFiesA+08AZRK15vV
         fLWeqxQa00dfw81aKRU5GudIsFSr1HPcQTlHW+4UrcejRE2odaxw7D5b9J0UhxR1l2Ix
         1WPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJfzz3Pnr2EfKZa9gtLAhlZw7jJuLonUo0n5XmSzdfeasb9TPBPEEpxoPo/g/P8Y3d9at8XF2nHe3tMGQ2syu0wIJMwmlKQQ==
X-Gm-Message-State: AOJu0YygmU4/f545c2SncByKXt/Cx62/DC1j8fzbJD1O4nLGeo4R6ADt
	M6k+sQG7IQp6RvDn/T1XraHoOgs6xeZ7zSvoS+dOWH5dAIXmwi/NsEfDszJzw9OYlggIaySxBtU
	Y70YQFQ==
X-Google-Smtp-Source: AGHT+IE48BmoAz19LivIJKqdAbMCqpfxz7jEJayN3mYHn75zffQS+fBHWs7tB+Hky/kzhZXErg20YA==
X-Received: by 2002:a2e:9bd8:0:b0:2ee:8a8c:ce5c with SMTP id 38308e7fff4ca-2eeb31818f1mr125362641fa.37.1720998564397;
        Sun, 14 Jul 2024 16:09:24 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eee18bec2bsm6606351fa.68.2024.07.14.16.09.23
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jul 2024 16:09:23 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52e976208f8so4129422e87.2
        for <ksummit@lists.linux.dev>; Sun, 14 Jul 2024 16:09:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWikL9FTFJKWdOzQRlhG+rd6832XkPDusRFfqwkquveROKGFa6FgMB3rdbBVTesbL9I4lr96vhwt6Mx2zupiKmn39/0/QzNBA==
X-Received: by 2002:a05:6512:3d1d:b0:52c:df4e:3343 with SMTP id
 2adb3069b0e04-52eb99948e1mr14032092e87.16.1720998563358; Sun, 14 Jul 2024
 16:09:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZpPFJH2uDLzIhBoB@sashalap> <CAHk-=wgyLHxdj0wJT-2y-OVVvPbZgg7XtCdcd6UHBmhTWLtoKw@mail.gmail.com>
 <ZpQdJpKhIzmf3veU@sashalap> <CAHk-=wjfXLDGBjieQhLRCP2tQnXTYhW2MiY3LWJ=g7QDE1cRyA@mail.gmail.com>
 <ZpQ0soWV6zIpgigf@sashalap> <0e6c7c8ed259dcb50631c6fdc3d86d3080bdc6f3.camel@HansenPartnership.com>
In-Reply-To: <0e6c7c8ed259dcb50631c6fdc3d86d3080bdc6f3.camel@HansenPartnership.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 14 Jul 2024 16:09:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjLShGxeGtjRGkjQni+VzWC0yrf34EP0AUn+_zU0u-WeQ@mail.gmail.com>
Message-ID: <CAHk-=wjLShGxeGtjRGkjQni+VzWC0yrf34EP0AUn+_zU0u-WeQ@mail.gmail.com>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev, 
	Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 14 Jul 2024 at 16:06, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> But we know how to enforce a unified view of process: we document it in
> Documentaion/process ...

Hahhahhahaahh.

Ahh, you're such a kidder, James.

              Linus

