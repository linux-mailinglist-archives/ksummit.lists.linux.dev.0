Return-Path: <ksummit+bounces-1909-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36689A4533D
	for <lists@lfdr.de>; Wed, 26 Feb 2025 03:43:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 882FF3AC2C4
	for <lists@lfdr.de>; Wed, 26 Feb 2025 02:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7382C21C9EE;
	Wed, 26 Feb 2025 02:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NczGOzCS"
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3E921CA14
	for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 02:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740537788; cv=none; b=J43fa8Rv9+py4OcrUk72OOp6eKH3hvsB0HFj+iKiuU5OwDWhjHBvNRkoyC6nszJhl8n2AcDUcg/3OCXP9/ObNVQ9y/ix9qhBW1FRg7ctXhEJFkyR0lcHpGb2xdC/6w+LUs2oidPWwD9D8lE+f3P4yCLDvFF/nlWElpFhhyKBkeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740537788; c=relaxed/simple;
	bh=toH3LLJ4yEUPEFJJkeDUNtt+w5hsIt5RNXu0wUSkCEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ItoZkAVM+dsL7fp5d2GQEXvvkMzARkXJSvdeuGnJ/jfKx29mSFeXgSA9QXmXYyULskGO1KAi9oKXamSdQ0uPRLA+LN3LY22rVSEozy7TzbBWjE4+payHn4wSTQemtx7/4Z6/SgjhPhahw9zqbmEO4iciaae7VaMAOrohKfOAJqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NczGOzCS; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4b68cb2abacso2062809137.3
        for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 18:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740537785; x=1741142585; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=toH3LLJ4yEUPEFJJkeDUNtt+w5hsIt5RNXu0wUSkCEg=;
        b=NczGOzCSibYh4Dyk2RTiJs3Or63157Zr+80YFZwCn4H1zqx01W16FRtvEtTIFd0z7J
         FAqF/Bzllw2XpQwqAE0K/WfHphGabFFDijrcxMtngRWssLxyyV4xRZ06B+HMPeoIMtMc
         WuDxIAahUfqezkNqHXrYXlY1Fkrrz89RbcU8+Yhd+z+HzPII0BVyx0kD0BSqc7narc6q
         t28GqN523v7lThJBLi3D3uINnfqcQd+qdleBxbgLTuSzlMmBcnIAjcMlHpaeJEpk+3t3
         himherS0FuyDfL3MVb2TVtkwMfhWZLUqdzszCaPpKIyi4517QLZHJylgs75wHcJH9DAQ
         BD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740537785; x=1741142585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=toH3LLJ4yEUPEFJJkeDUNtt+w5hsIt5RNXu0wUSkCEg=;
        b=EQyik95Hlq1EXKDBIGEpm5YJB8Y7YidfZJy2RbwCLhanMMFubRWuy2vFHTCYOuv2oZ
         1u4HXs1gZH4BUHdFBCXy7nYXgaCViuliVSR+5HG+rrQpP/8XD17DQY2iZyHscd9LWjSd
         CthunPs/Iir2kq4r7mdSozomL7NheOzKS3Q1gcivOWt+F0WC/436hpmEjaVCcxhqDRND
         8e38JJefDGqiaHLDZlfcY0l0hdz5lYlJGa6mSHR9Bk0d60XU2MBYZ3gAm8zoTp6ZexfT
         C5KhhN35Xo3iZT+7N2KI7+YULb/xTimINoEm182RqqC/WAegcNCP+ORH3CMBvLOsVhTu
         ckUw==
X-Forwarded-Encrypted: i=1; AJvYcCU1If1pu6jrrAgRvDL+VNCeGMl+guo5D8NWkAHQf1ASAHVu6MSuOBRV3CPud1B9o20ARvQx3NBs@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8IQGABiI7oAOPvTIP2hRhTS+7hjU7uC9M+sdpLan4PFYNIBfT
	JPJkW9UQiCW8JyHYQoWMezdvaaoYRws1pnPVnaVjIPSKX6rYJNgg34aqzm2RpOKEHlHC0SQD4Vs
	4k4bcOATDFLU8y1mtvaoYI7Omg8E=
X-Gm-Gg: ASbGncta2Z40/wkkFwJ0JCbp5mBH8367Nyne/jT5xb9QIbwSS44RkF/9eDuyfo1ctAs
	071GhwIvYNRLxBbSjRJ2/v60P16WVcRODIZcqQ+j0PrvVXq3uybo/bNuHnMIx0iNS5jqrYbH8XT
	tAt2//i6u1PArvqjjuoFMrUqp5s7+MXw6fuYszHB8y
X-Google-Smtp-Source: AGHT+IFyTwJlrcVaI9Xt7UsNlvVNkw+pfbUmTO93JXE/w2WRLS6A9yWh/tpYZMvkzO//S3frbcvZZAjWp8KTSUoz2Yg=
X-Received: by 2002:a05:6102:304a:b0:4bb:edc9:f94b with SMTP id
 ada2fe7eead31-4c00acf5903mr3329725137.5.1740537785120; Tue, 25 Feb 2025
 18:43:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2025021954-flaccid-pucker-f7d9@gregkh> <20250221051909.37478-1-felipe.contreras@gmail.com>
 <Z7gQ3kSeCf7gY1i9@Mac.home> <CAMP44s1Ai5qMU4yV+Rwz4cY869ZA=cxBcTf2wuaUY1oyLKUNCg@mail.gmail.com>
 <Z7zYdEM5TkT2LNN1@boqun-archlinux>
In-Reply-To: <Z7zYdEM5TkT2LNN1@boqun-archlinux>
From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Tue, 25 Feb 2025 20:42:53 -0600
X-Gm-Features: AQ5f1JpIvNFnhj4Gl3DBpIQBv48BIC95sgeBSdxDcuyCbpdR3DNiyGlnB3PQEpM
Message-ID: <CAMP44s3W1XUBma0AvTd5qeNaqZoScNd97m_aQUK=GqYYeMs-ag@mail.gmail.com>
Subject: Re: Rust kernel policy
To: Boqun Feng <boqun.feng@gmail.com>
Cc: gregkh@linuxfoundation.org, airlied@gmail.com, hch@infradead.org, 
	hpa@zytor.com, ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org, 
	torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2025 at 2:37=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Thu, Feb 20, 2025 at 11:59:10PM -0600, Felipe Contreras wrote:
> > Boqun Feng wrote:
> > >
> > > On Thu, Feb 20, 2025 at 11:19:09PM -0600, Felipe Contreras wrote:
> > > > Greg KH wrote:
> > > > > But for new code / drivers, writing them in rust where these type=
s of
> > > > > bugs just can't happen (or happen much much less) is a win for al=
l of
> > > > > us, why wouldn't we do this?
> > > >
> > > > *If* they can be written in Rust in the first place. You are skippi=
ng that
> > > > very important precondition.
> > >
> > > Hmm.. there are multiple old/new drivers (not a complete list) alread=
y
> > > in Rust:
> >
> > That is a black swan fallacy. Just because you've seen 4 white swans
> > that doesn't mean all swans are white.
> >
> > > , so is there still a question that drivers can be written in Rust?
> >
> > I didn't say no driver can be written Rust, I questioned whether *all*
> > drivers can be written in Rust.
> >
>
> Huh? Your previous reply is:
>
> "*If* they can be written in Rust in the first place. You are skipping
> that very important precondition."
>
> how does that imply you questioned whether *all* drivers can be written
> in Rust.
>
> Care to explain your logic?

People should really stop thinking in black-and-white terms.

If I say I'm not convinced the coin landed heads does that mean I'm
convinced the coin landed tails? No. If I say I'm not convinced god
exists does that mean I'm convinced god doesn't exist? No.

Being skeptical of a claim is not the same thing as believing it's false.

One can hope all drivers can be written in Rust while at the same time
being skeptical that that is necessarily the case.

--=20
Felipe Contreras

