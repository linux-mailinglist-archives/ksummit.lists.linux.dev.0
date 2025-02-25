Return-Path: <ksummit+bounces-1905-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B16A4507C
	for <lists@lfdr.de>; Tue, 25 Feb 2025 23:50:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 034F23ABBFE
	for <lists@lfdr.de>; Tue, 25 Feb 2025 22:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9335F231A21;
	Tue, 25 Feb 2025 22:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3uO+Pbu"
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C2B1C84C8
	for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 22:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740523799; cv=none; b=pLe95Cf22uRsETnhLvF+F/cSaGu7EFOwT2NghTugE5ltz158azh4IiqRCtH2fcqZiwAid2Dty6GK4cMUupfehLwSZz/R9mYCNPFqwcWFeVsTz3FWu8CVzAxIL6yeSS8ONjwguG/IkK/cIKQ0XdQL/NfMcxyuJMoteC2HGbFD2AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740523799; c=relaxed/simple;
	bh=ZPDs8LNZsJnYQ9iypBZFXD84ihEHpoj8WDp6I7n5MoA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SbRz8oPPOPZxZhMBQvUn83mSAfyLKTH9XFikqHLgdHkxXVQqU0mE6ob4wJlap3hjDYrRB3oh11vj9VN+1trzum/NXaL/0z0R3F0Hdj4gvo4hCvoFXQ4/6sIcJUVQY/i1EO2oTFN2RHSTBUcQgI2nypCFgsHCE1KehSYKEB3Dius=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3uO+Pbu; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38f1e8efef5so3647326f8f.1
        for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 14:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740523796; x=1741128596; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLb9xdr33jY7x/utSZ7Yba2eaqmn62xwf00HqA96Qdg=;
        b=k3uO+Pbur/sHIDr/nkfmynN8CWbNwsxKPMkRRAIFk4dvGaauHqVKKSOkvvgiLnyiJH
         qmITZRzjo9lUdN7xcSlGx0JMLL8YyK9EQXj5v3dinEXwpFLthBpnLzD8Ukx7fchJCqWc
         YVW2uOQS1/U8L9bKygLNO8aCvqC94wtgezorJdEIeggBPfr3Il9CuxBEYF3uiN+286Tl
         jmXMR8c+YCIFwRmavgwI5RU0hqYsObr/vvQ7TCTAMKlnDl7mD7sAVhho9ClegHFOeRAf
         tPgLkPZ3cgZNzxHgaYzTHF9kcAV7R++Y8Qe3GLbR45w0YqrdUvoCiHPqWxk530MhTX4S
         Qk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740523796; x=1741128596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pLb9xdr33jY7x/utSZ7Yba2eaqmn62xwf00HqA96Qdg=;
        b=UyaeWPc/o/ZDTuHGfZoACHv/OEJ0J667uMCyODT7VetCvvabU5tTNPuKf9SNXGEiL2
         rZFRNFa/x0o0lntG78rgEYnBuSjF7zPIIFNkbqynCNGID6yoPtcqvjDtSCPfkWxIoIpe
         baJ9H9NSNdYL5IcspPrAcswByBOsOaHBxbY8VmUa4x1vDz/hIRGIFNrXvCcnDgUbJOBX
         LYqU+NFLl5nOB5m3W0DWVgVTw54k73MflVDpXfzOoYFoDhtXyNoldUrtr+TvJIK9AYU1
         wjRCmVs/DC+c077g9n5u68dV8Lav7G8LT3Tk0TJ2ou4XbayztUt75m/+oXptE8zu6MPI
         bYVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkpFKub2xGH6oVDG/sGp9SPfcNwflzd352MjgnP6vAsLyvhDyXdzQaKSIiUVe54WBLfSToRwPg@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6+GmfQQrJ4h5GX7PZBOOVLbCFNBKZpIFJaNgC9Ej39DTKe/ik
	n0cEwiVLXaBdHUrg/eMlRf7WKIOwYB79X4YjRYlMGUsog3W8qlQl
X-Gm-Gg: ASbGncus8Q5Y0GmEE1ymuNHC54Uj5jYDhEQwKjDMK+9j2EpK8NvdKDW9HwF9TjrQjhW
	9mf6Wv9F6w3qEvHZ0AP/FD3uF/MuweL4TBK+9McO1W4KNOUfWtPgypxMoGK4y0clJxRNiHxnRgk
	OqOQMM3OXtHXAaMiZhAy2Jx7ICmAk/ysZn/vqwbKT2cVhrgYG97zdeuhA4Az/7Kf5w6gRcuLFIT
	8ef2VUHSzK+cn1JgJ8TdSJjJTMe30Dx2qKAI1Sq3Vq+itlNvxawu5XxTiXvFt2kf2doc8aGpuuo
	PFwbrd5KBUuCS0exIqIDTVGcH6jnVyPj1aY3p3L6DPAZTKf5DB25eLGeJByyR9xr
X-Google-Smtp-Source: AGHT+IEwtF38qaeTV7BlN284dLspJxz9Zu1Bz3VFTTaz7FUxJjMXShkv4nJrcPh6zoVhoNxEIB80bA==
X-Received: by 2002:a05:6000:1447:b0:385:ee40:2d88 with SMTP id ffacd0b85a97d-390cc5f20e0mr4597676f8f.3.1740523795819;
        Tue, 25 Feb 2025 14:49:55 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8fbb5dsm3592424f8f.84.2025.02.25.14.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 14:49:55 -0800 (PST)
Date: Tue, 25 Feb 2025 22:49:54 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Martin Uecker <uecker@tugraz.at>
Cc: Steven Rostedt <rostedt@goodmis.org>, Linus Torvalds 
 <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 ksummit@lists.linux.dev
Subject: Re: Rust kernel policy
Message-ID: <20250225224954.4766e018@pumpkin>
In-Reply-To: <fd053f18e3856d070d695ea969b3fd635272e8e0.camel@tugraz.at>
References: <326CC09B-8565-4443-ACC5-045092260677@zytor.com>
	<CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com>
	<a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com>
	<Z7VKW3eul-kGaIT2@Mac.home>
	<2025021954-flaccid-pucker-f7d9@gregkh>
	<4e316b01634642cf4fbb087ec8809d93c4b7822c.camel@tugraz.at>
	<2025022024-blooper-rippling-2667@gregkh>
	<1d43700546b82cf035e24d192e1f301c930432a3.camel@tugraz.at>
	<2025022042-jot-favored-e755@gregkh>
	<b9a5de64fe1ded2ad3111763f35af9901bd81cc4.camel@tugraz.at>
	<caea3e79-78e6-4d98-9f3b-f8e7f6f00196@stanley.mountain>
	<61a7e7db786d9549cbe201b153647689cbe12d75.camel@tugraz.at>
	<20250221124304.5dec31b2@gandalf.local.home>
	<CAHk-=wgg2A_iHNwf_JDjYJF=XHnKVGOjGp50FzVWniA2Z010bw@mail.gmail.com>
	<6b3e4d3bdc9b6efd69068e5b22cfd05d370aed19.camel@tugraz.at>
	<CAHk-=wg=pZvE9cHJUPKGCajRUCtDoW73xwY5UfJApCWms_FgYw@mail.gmail.com>
	<20250221172415.5b632ae6@gandalf.local.home>
	<fd053f18e3856d070d695ea969b3fd635272e8e0.camel@tugraz.at>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 22 Feb 2025 00:37:01 +0100
Martin Uecker <uecker@tugraz.at> wrote:

> Am Freitag, dem 21.02.2025 um 17:24 -0500 schrieb Steven Rostedt:
> > On Fri, 21 Feb 2025 11:30:41 -0800
> > Linus Torvalds <torvalds@linux-foundation.org> wrote:
> >   
> > > And yes, it's wrong in general. The problems with "x < 0" warning for
> > > an unsigned 'x' are deep and fundamental, and macros that take various
> > > types is only one (perhaps more obvious) example of how brokent that
> > > garbage is.  
> > 
> > The bug I recently fixed, and I still constantly make, where this does
> > help, is the difference between size_t vs ssize_t. I keep forgetting that
> > size_t is unsigned, and I'll check a return of a function that returns
> > negative on error with it.
> > 
> > If I could just get a warning for this stupid mistake:
> > 
> > 	size_t ret;
> > 
> > 	ret = func();
> > 	if (ret < 0)
> > 		error();
> > 
> > 
> > I'd be very happy.
> >   
> 
> GCC has this warning, it is called -Wtype-limits

That bleats about all sorts of stuff that is reasonable code.

> 
> https://godbolt.org/z/M787vjhfo
> 
> It is activated by -Wextra.
> 
> (anyway, not at all related to my proposal)
> 
> Martin
> 
> 
> 
> 
> 
> 


