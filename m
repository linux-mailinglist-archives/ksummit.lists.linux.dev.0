Return-Path: <ksummit+bounces-2007-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF21A48B38
	for <lists@lfdr.de>; Thu, 27 Feb 2025 23:18:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 067F23A7AB3
	for <lists@lfdr.de>; Thu, 27 Feb 2025 22:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA8127290D;
	Thu, 27 Feb 2025 22:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbzfLSWa"
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF15271298
	for <ksummit@lists.linux.dev>; Thu, 27 Feb 2025 22:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740694688; cv=none; b=QGw9GhebAvL68L3l/73FFhTVrftNLOe9JcZKADYbcS4MvTONs9mvUmCo74RylZ33s+D9cL4e7oNdCPClmZNwPmae7OYH9l9ez9nsoVdD2aNmqCMjeZEgqhoF1/CroYF6dC1U4yM8M0moRSgl6/7UNFqlTSF+JHZV4rdXnX/pwhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740694688; c=relaxed/simple;
	bh=dpLPdoKIs3LeqgrVPPxuOQBBRUH3k8TIgoIASRxT7pA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=duj21SgWG6romhmAvjz+Kdy017vCkh9MueHcwOpWNMxjTw97u7xB+alQHoZHOLGSofHzGRsTlnDpjg/f+avwwNWfHqu2cr4+5vGnWIZqf6+STbo+zZ171+xU92Nkr2FVvKq6fWD9dzc3yoc/ZwOI7tKt7371cJHYJe80ol3Ogx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DbzfLSWa; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-439350f1a0bso10012035e9.0
        for <ksummit@lists.linux.dev>; Thu, 27 Feb 2025 14:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740694684; x=1741299484; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qE7pAv4W7yuiRGioyB5dU0oQhIbvtWoB+MtssPnANU=;
        b=DbzfLSWaUGeaEOS2iMAhtVcoGxtaBdMP80kYxrRuj3fYiYkry06JOyXE8Jxe6IFAvp
         q3bJg9AKn31bUqiWH+F7stsO+jPT7lYGVKvUDdLiR8uuzZy0Zs67SDIj1I2kLK30paTS
         cDLoidafsEQ6fNHRtDVtb6sHIosC4ch8Bgdk5o9bmdU8xUcxoSM1kHbQAHBTDoW/auqN
         2MUTT0dA1RGZMsyJhVK6usdgcCHRxv24np3mce/j+Pgu884/YYS6PAO4phl/WbPBNHaW
         ulSPsRYaniqvoLZ/NocAOOSLBp2J9fa5kQPnZdk0jAdBkYq0XEyDYT2JuuZfp63Osth1
         SQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740694684; x=1741299484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+qE7pAv4W7yuiRGioyB5dU0oQhIbvtWoB+MtssPnANU=;
        b=IyNFhmX8RkwHX4cMczM1WWeEQWN524j9HziGW5nThfbKLCTEA+5AzeXE758kfA/qIB
         FHx3z3/a82yru56DfAvk8N+nTiHp9keqs9auQWIIyILIAqANlHkRG+cVSOCfL59AB7GY
         UCMX8cR16YxqVgcoaSF9+3uDQwYZHiy49mUQVfb3M/7LV9rxJTGpo22YqHeYZ8OToLS6
         08eeb2yAY/UDtGpkZmJMpvdfPAzT1JB8NrOWOvi82OIQhYqpJ/MLl4PIVbqc3cH9eab3
         LdrHsvxXO74yhoIloHgSx3+8rCSD4r4ihlB4o2Xqp0Yt7EkIQ7NZZyfo3qMADq2BVCoa
         WFkw==
X-Forwarded-Encrypted: i=1; AJvYcCVduKbylDg6/Ch0DUXTkqhlclPsu6UL3d23Ir7M/8dtpEe7IUkr3Y5usBYNgDCkIH8YVvtKk6iT@lists.linux.dev
X-Gm-Message-State: AOJu0YwM+tjgJIO5lDsarcnbjHBrBjtzhT8sUhDldqapOlApL1H0TeBH
	D2grQn/uugYXaAddh2JJf0Z+lcn/jiSzzFFeNPOj53wJhjGD/aqS
X-Gm-Gg: ASbGncsLKjPTwFD+GDuv4fA6r4beFGek3oNI2ntRR+C1Sl53/GhptFRdn6TNjUP05qF
	ifXPZ+XnxJ73sox8yi9Lp3FTiiiJQLqG8jL6af5WTdhkCYw8Gs9Qf+J6mrmJ9y2dSKerD5b717a
	q6QqA28lNYHpIqKg0mC6+8vI6oRrblkXdf3fcJta0VWMbm+vRT+/OZVPqh+ZQiYOsY1swmWITq5
	kFNs0NLI9ngAKCNKAR0C58XSOWhZrMvuxvfNpnUvouMzMcD7mWM+FIa7wlfZLpIXgWsgTwdOb4+
	40eLnACFtSVLdDkdmugVDz7wd8e6qef0ao9aFLM1R1cf+3xpsws0xIkMaQJC4CLA
X-Google-Smtp-Source: AGHT+IEIpLxegfdcRnz87rqWS26ts4HVv2BxORGQ1GFs3CHTjTrNYdNUUZHlhyGNdIE5bGGu90EjBQ==
X-Received: by 2002:a05:600c:4351:b0:439:96a4:d2a8 with SMTP id 5b1f17b1804b1-43afdda613bmr39443845e9.5.1740694684396;
        Thu, 27 Feb 2025 14:18:04 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b7a27aa85sm35486045e9.28.2025.02.27.14.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 14:18:03 -0800 (PST)
Date: Thu, 27 Feb 2025 22:18:01 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Ralf Jung <post@ralfj.de>, Ventura Jack <venturajack85@gmail.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Gary Guo
 <gary@garyguo.net>, torvalds@linux-foundation.org, airlied@gmail.com,
 boqun.feng@gmail.com, ej@inai.de, gregkh@linuxfoundation.org,
 hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: C aggregate passing (Rust kernel policy)
Message-ID: <20250227221801.63371d19@pumpkin>
In-Reply-To: <rps5yviwyghhalaqmib3seqj62efzweixiqwb5wglzor4gk75n@oxki5lhsvhrf>
References: <lz7hsnvexoywjgdor33mcjrcztxpf7lzvw3khwzd5rifetwrcf@g527ypfkbhp2>
	<780ff858-4f8e-424f-b40c-b9634407dce3@ralfj.de>
	<CAFJgqgRN0zwwaNttS_9qnncTDnSA-HU5EgAXFrNHoPQ7U8fUxw@mail.gmail.com>
	<f3a83d60-3506-4e20-b202-ef2ea99ef4dc@ralfj.de>
	<CAFJgqgR4Q=uDKNnU=2yo5zoyFOLERG+48bFuk4Dd-c+S6x+N5w@mail.gmail.com>
	<7edf8624-c9a0-4d8d-a09e-2eac55dc6fc5@ralfj.de>
	<CAFJgqgS-S3ZbPfYsA-eJmCXHhMrzwaKW1-G+LegKJNqqGm31UQ@mail.gmail.com>
	<d29ebda1-e6ca-455d-af07-ac1daf84a3d2@ralfj.de>
	<CAFJgqgQ=dJk7Jte-aaB55_CznDEnSVcy+tEh83BwmrMVvOpUgQ@mail.gmail.com>
	<651a087b-2311-4f70-a2d3-6d2136d0e849@ralfj.de>
	<rps5yviwyghhalaqmib3seqj62efzweixiqwb5wglzor4gk75n@oxki5lhsvhrf>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Feb 2025 15:22:20 -0500
Kent Overstreet <kent.overstreet@linux.dev> wrote:

> On Thu, Feb 27, 2025 at 08:45:09PM +0100, Ralf Jung wrote:
> > Hi,
> >   
> > > > > If C was willing to break code as much as Rust, it would be easier to
> > > > > clean up C.  
> > > > 
> > > > Is that true? Gcc updates do break code.  
> > > 
> > > Surely not as much as Rust, right? From what I hear from users
> > > of Rust and of C, some Rust developers complain about
> > > Rust breaking a lot and being unstable, while I instead
> > > hear complaints about C and C++ being unwilling to break
> > > compatibility.  
> > 
> > Stable Rust code hardly ever breaks on a compiler update. I don't know which
> > users you are talking about here, and it's hard to reply anything concrete
> > to such a vague claim that you are making here. I also "hear" lots of
> > things, but we shouldn't treat hear-say as facts.
> > *Nightly* Rust features do break regularly, but nobody has any right to
> > complain about that -- nightly Rust is the playground for experimenting with
> > features that we know are no ready yet.  
> 
> It's also less important to avoid ever breaking working code than it was
> 20 years ago: more of the code we care about is open source, everyone is
> using source control, and with so much code on crates.io it's now
> possible to check what the potential impact would be.

Do you really want to change something that would break the linux kernel?
Even a compile-time breakage would be a PITA.
And the kernel is small by comparison with some other projects.

Look at all the problems because python-3 was incompatible with python-2.
You have to maintain compatibility.

Now there are some things in C (like functions 'falling of the bottom
without returning a value') that could sensibly be changed from warnings
to errors, but you can't decide to fix the priority of the bitwise &.

	David


> 
> This is a good thing as long as it's done judiciously, to evolve the
> language towards stronger semantics and fix safety issues in the
> cleanest way when found.


