Return-Path: <ksummit+bounces-1969-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 204CBA46ECB
	for <lists@lfdr.de>; Wed, 26 Feb 2025 23:54:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AD86188B32E
	for <lists@lfdr.de>; Wed, 26 Feb 2025 22:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64DD325E82F;
	Wed, 26 Feb 2025 22:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="feJu3EEi"
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D8D25E800
	for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 22:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740610457; cv=none; b=iPrTcytglugq5wHOlNyVmaiV3hAyzOhpLUshM4LTkkVrx+sAOYLcTaS2h9SmuLkHj2gYWItqWt3anUo/B/BWKZPmI9Uu+QJrZfY6MmPFOX5sIebvYC5f78Kb3JWFoCc7LeVDQlzHC4zu5QWUBNXRVS3BUUzJX4b/GPIyCUhg5AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740610457; c=relaxed/simple;
	bh=1sPPljet3ACTgKI4+mgP1c5oGZKB8Hf8G8BN7ZnjVIg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QGMXTHGS6RKFd8lOtFe12lIyBryBKDpF6XpLw35wielYZUJNdZB+cnADqSBX1EKrTIiUAyqXt8dMX7/TBpfeDdwpJE5aeUgqGAkqXhLHWtDI/RsqxrZMwCXf45dZf9Lk00LLBl2DSnWGLCA/4Go1UpMSR+IJ9H0rIiDtUBDUQis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=feJu3EEi; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-390dd35c78dso658779f8f.1
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 14:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740610454; x=1741215254; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SLvO084dN+2d+/gLjub5lI3vWtdzNWw7Y3/rBNHH74=;
        b=feJu3EEivqV/zxyT/VRRQvBjn9sLTgtivCNU2GlyhB9gGuBOZOoFEnercQvJkZSDUt
         xUy552o0FDfuk405QsjySYrqR1AJ6udxzjLf2TIx+5F7kVBzgU5tPuF09+iCqcNZyDJG
         h+FnlMxX4afGx4PWvesxv8TKXS7uulf39zv+dsVWIWTHUUVnnyB3hqoJ9iO+ifsWyIeB
         oQibIAgBixgE1nhrnq3Vz+X/b+xhFPdnixjzbRwsxBy7ZvEIgNBxRxJTLzQAOZn8vbso
         zBiIZO4mmUuFr/HD5gA8JC4yt8ZZG7BbJj76GxilwFSX4BJtTeHbM7YLHR6ZMT7lgzqo
         fYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740610454; x=1741215254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1SLvO084dN+2d+/gLjub5lI3vWtdzNWw7Y3/rBNHH74=;
        b=OGIu63I6ywSqSzh/gof8GWzM+/jq02V9SBVIDNWMUSZlia24bwOZnPpYzfHcu7386K
         jpjIleX1Gcr9pw8s47xuLQbaMB+u7JWF+IO91Llu2XJAvNtq4obNQ+5BpO7JN1cjqURJ
         LxgebNNpOv6e4lLIpMYeO026LZ9F6TLEs3c8jYsGwq4FNzFsrXbTNp4t39wcgI3vNkqH
         9hvJB/KNHgJKYfvspEdQHMH/gFm/CrigbrSNkXeOffGI2i16pOmuXzznrjp5Sr84jLwF
         5YfdfuQbrCJwHM5t5YUWWRPkHRIn2ikJDMvPQo++TNiobd1cnp5gSQKrViWrLSffFdmQ
         G0nw==
X-Forwarded-Encrypted: i=1; AJvYcCWqg680jajGmNdjjohSqPQ6sdWbqogxWk26R49F7D3vk3Zqni9SviGJQShnvBucJMYNYPmbTfMx@lists.linux.dev
X-Gm-Message-State: AOJu0YxaWMyTjROi+Y4rZhVssNuHlhuYB9ybnz9MVyxikhu3Ue3Ns5lB
	9qD1bzajbQ9Uw2iPYr0ekkkh9YbLfhGRElP3MInDNhapbC7C5AwH
X-Gm-Gg: ASbGnctDkLdUyxYNZOIZf+eSmpdizwZNfB+h2RNVawLnr7FazF4V//9pcwm0k4vJNf3
	OfouBlC03j/fwDee1tt3i4ZXKdQ0cH6vbhLDKxq5bFM/Q5vioEUCcLZn3ziY9bjX6eH1HbF1iD2
	373hxEqdnbmtvzJC9Ykq1W7i81kW6TYF7pMJaicUT+w2eHBTA8kiG/sfJHc2geKX82eLfqeDZR1
	eqISuHtqoWkvifNQt4onl5sVPqEWacEklmJw2bPsbAKp+2aYNxaMJxpg2f+kihMtkRMkPxy94gl
	eqS7jLfj/0SexTFY6ikmvdiTqgTeGnwvXzGnfE2o8/+CjENQA7NXsBnDiwigqNzH
X-Google-Smtp-Source: AGHT+IHC+KkP1LTJHqKHVvWCgThNFJjKkJxpW6IERDcsLbEjELPz4ud+GHuN+VTB6Z2Q7/ZHjZSbAQ==
X-Received: by 2002:a05:6000:188f:b0:38d:b028:d906 with SMTP id ffacd0b85a97d-390e169981emr1006277f8f.21.1740610453752;
        Wed, 26 Feb 2025 14:54:13 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e484452asm184751f8f.61.2025.02.26.14.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 14:54:13 -0800 (PST)
Date: Wed, 26 Feb 2025 22:54:12 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Martin Uecker <uecker@tugraz.at>, Ralf Jung <post@ralfj.de>, "Paul E.
 McKenney" <paulmck@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Ventura
 Jack <venturajack85@gmail.com>, Kent Overstreet
 <kent.overstreet@linux.dev>, Gary Guo <gary@garyguo.net>,
 airlied@gmail.com, boqun.feng@gmail.com, ej@inai.de,
 gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com,
 ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: C aggregate passing (Rust kernel policy)
Message-ID: <20250226225412.35133185@pumpkin>
In-Reply-To: <CAHk-=wj3C7Gc7pB0BD+5dvrFWh8xNJLYgupq6parOCFk94VyoA@mail.gmail.com>
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
	<20250222141521.1fe24871@eugeo>
	<CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
	<6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
	<CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
	<CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
	<CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
	<CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com>
	<5d7363b0-785c-4101-8047-27cb7afb0364@ralfj.de>
	<CAHk-=wh=8sqvB-_TkwRnvL7jVA_xKbzsy9VH-GR93brSxTp60w@mail.gmail.com>
	<ed7ef66dbde453035117c3f2acb1daefa5bd19eb.camel@tugraz.at>
	<CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com>
	<CAHk-=wj3C7Gc7pB0BD+5dvrFWh8xNJLYgupq6parOCFk94VyoA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Feb 2025 13:21:41 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Wed, 26 Feb 2025 at 13:14, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > That "single read done as multiple reads" is sadly still accepted by
> > the C standard, as far as I can tell. Because the standard still
> > considers it "unobservable" unless I've missed some update.  
> 
> I want to clarify that I'm talking about perfectly normal and entirely
> unannotated variable accesses.
> 
> Don't say "programmers should annotate their special accesses with
> volatile if they want to avoid compiler-introduced TOCTOU issues".
> 
> Having humans have to work around failures in the language is not the way to go.
> 
> Particularly when there isn't even any advantage to it. I'm pretty
> sure neither clang nor gcc actually rematerialize reads from memory,

I thought some of the very early READ_ONCE() were added because there
was an actual problem with the generated code.
But it has got entirely silly.
In many cases gcc will generate an extra register-register transfer
for a volatile read - I've seen it do a byte read, register move and
then and with 0xff.
I think adding a separate memory barrier would stop the read being
rematerialized - but you also need to stop it doing (for example)
two byte accesses for a 16bit variable - arm32 has a limited offset
for 16bit memory accesses, so the compiler might be tempted to do
two byte writes.

	David


