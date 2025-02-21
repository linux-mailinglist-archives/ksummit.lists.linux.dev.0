Return-Path: <ksummit+bounces-1783-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E43A3EC69
	for <lists@lfdr.de>; Fri, 21 Feb 2025 06:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D9A8188E172
	for <lists@lfdr.de>; Fri, 21 Feb 2025 05:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60D91FC0FA;
	Fri, 21 Feb 2025 05:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgrEHbNl"
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60CA1EEA59
	for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 05:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740117564; cv=none; b=WWGbYNGKZaTMWCLlZphOGPG+/uGREKCgNdu31MYn97gb7cdwQLg23OPTsQOge88lNGy927f6dZIsXC7yCl0gk4IO24S0maSC59LZJBEBrjFhfv581SdwoeP6/j0SbXQirtQ+497dBqs2FMVB5NbKFtd1sKcr4GWQGBFJSziAyE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740117564; c=relaxed/simple;
	bh=ibHzWRvBjhxfOa5MDrD8eYfboMb902KHcCF3VtsllUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cjp9OY6t9MYQy8RSgFB1G7h+P6AAGr+xb3Xe/NWU+wufbxXWQLBE82k4HUMg02crvrCvSJ1J4qmtdmrxbUnZQjTc3uouZtF4P/DjR1c/raIf/ks1Ppg81KI3lq3hfvYcI8LdAePDtTCFsxiFwI979zTxjefqW5GnDfSHhFiFhNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgrEHbNl; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-520a48f37b4so924048e0c.2
        for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 21:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740117562; x=1740722362; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gwyvrx/Jezq/07hjLkAb8nbo563bqDJpeescdjeTq+k=;
        b=CgrEHbNlhLocas+zxPhzm0dkTjcccVfhyBCR8Dm/evKCjAjuuXxIyGEaX0cAU3UEPO
         YW6L56HBn1ZZUBEbQ3ugBj2KKAy8bI3BxwlYB4sQj3CuQ6nD5KZgFhKlY5MVAWPi4194
         K8tYSijC6l5ePwUP+IRrIIeKamETu+nqtUL+jSoe7wbIvmHe3/vuGDE5wF33GUJpIXbb
         UIkXZdncy8l09xLUZOP5p/au8c7jcClxPtD9nD8sZZSdu3q7Wg+ztysxm5eysA4oDz2L
         oUNpOlJSEyacV41ab9e2hg+Is8Xy/DojSDiRfq/5NwN9qamQqEei0EQxqiB/UnFmK47v
         qT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740117562; x=1740722362;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gwyvrx/Jezq/07hjLkAb8nbo563bqDJpeescdjeTq+k=;
        b=W3X8GQOnzj+pmvVewG8Zqjw+EiNm+q2R/Yozr1Xhv11bGPRTIikZlmatPEEthW6b39
         PFQDWNTQq2MvZWK3xfmiLRF5v1MwQ+qHLcs5UpT7ypX2+uXVGoBDh7/+O4tOVFvTpmWr
         ax4ebFJ6ywXlTcX5KeWd0p+WMGgS771BKehAJvlKQIfDgtxcMwEKZ4PECRYLTHs6plZ7
         POG6X1br9HvpfOa+foAVnQ+D/1ARJ8J3f9wIs73EnSEONrocB/8WtrErcJ70fscwhA/I
         11iowYAPwMX0B+mf+60/L8DKU1jUaTRebj4f08ObO/aN053QEOVB330TMjKAqUz8+OK+
         x6Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXJDUqrwCbdlugesRksQ7uEfaWC8RzPDXhMLFwLrsm9SO1uVV9WtpVO5ukfy1GzM87C1Hh7swcJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzHN3YR4LgD5OI8eNjyt9AD1+NkDYAgBTK+fBpk+ou34E+E4SOr
	FC9jLnS4TNoIqi0x/yyE1tmxRjy3JCGK26lHwiJUdNoW4u3Oogn3tq9LEdSJK864gbM5qVw6nV2
	XI3T4hbhQCm+yJWvcYBzL+3TC/8M=
X-Gm-Gg: ASbGncs5xUIrMO3cdNuE3EI2fDOgggXCA6uHjP2ZUM5BT3NZczT5S53lPxB5i9RURGr
	AGKs5cc+qsDEZUGqqYN2SdKLMIWDLDB7FBxW46Wvjw52av3sqzJ9yaE6bxwuUryi60uTmfiJ9mW
	qzM+vfyQ6xpX+F2goLUUAJsPBBhxu18zyHon8pfZyx
X-Google-Smtp-Source: AGHT+IFK0Te2gAAu9/ippDJ8IfNRI2f4AiOjMhPMlVJgO17ZMIkw5wXZbxAhshYN4Tkjwgte5xFD1iXsknqV9tsPGRY=
X-Received: by 2002:a05:6122:3d03:b0:51f:3fa3:d9af with SMTP id
 71dfb90a1353d-521efb1aa44mr620312e0c.1.1740117561686; Thu, 20 Feb 2025
 21:59:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2025021954-flaccid-pucker-f7d9@gregkh> <20250221051909.37478-1-felipe.contreras@gmail.com>
 <Z7gQ3kSeCf7gY1i9@Mac.home>
In-Reply-To: <Z7gQ3kSeCf7gY1i9@Mac.home>
From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Thu, 20 Feb 2025 23:59:10 -0600
X-Gm-Features: AWEUYZm-dCCYDK7IVFbcHBzJ3z4WArMhXwpI8ggrnPh3sijx9AIfdIEQ8lnlDjM
Message-ID: <CAMP44s1Ai5qMU4yV+Rwz4cY869ZA=cxBcTf2wuaUY1oyLKUNCg@mail.gmail.com>
Subject: Re: Rust kernel policy
To: Boqun Feng <boqun.feng@gmail.com>
Cc: gregkh@linuxfoundation.org, airlied@gmail.com, hch@infradead.org, 
	hpa@zytor.com, ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org, 
	torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"

Boqun Feng wrote:
>
> On Thu, Feb 20, 2025 at 11:19:09PM -0600, Felipe Contreras wrote:
> > Greg KH wrote:
> > > But for new code / drivers, writing them in rust where these types of
> > > bugs just can't happen (or happen much much less) is a win for all of
> > > us, why wouldn't we do this?
> >
> > *If* they can be written in Rust in the first place. You are skipping that
> > very important precondition.
>
> Hmm.. there are multiple old/new drivers (not a complete list) already
> in Rust:

That is a black swan fallacy. Just because you've seen 4 white swans
that doesn't mean all swans are white.

> , so is there still a question that drivers can be written in Rust?

I didn't say no driver can be written Rust, I questioned whether *all*
drivers can be written in Rust.

People are operating under that assumption, but it isn't necessarily true.

-- 
Felipe Contreras

