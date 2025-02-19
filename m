Return-Path: <ksummit+bounces-1690-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE86A3B132
	for <lists@lfdr.de>; Wed, 19 Feb 2025 06:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3F1F3AD321
	for <lists@lfdr.de>; Wed, 19 Feb 2025 05:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7511E1BBBFD;
	Wed, 19 Feb 2025 05:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OpAZ6SE7"
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496C61B86E9
	for <ksummit@lists.linux.dev>; Wed, 19 Feb 2025 05:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739944783; cv=none; b=UXhZ0OFlTewdjBMoI495pR4d4ZyIoWrJtYOMHuLaFnPRdI+N/AZFJtOnDrkdH7VM1t2j/vTQhAeB153aDmfejAK6/D1fBq3N/NvJJ+UL7xXR9E9ezOy1pZB08Z/zSTtq2u7HUtb+Gohnt2hRR6JtV+wWwuokEQYexUnb9+7f8M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739944783; c=relaxed/simple;
	bh=uElxjeT4hItqlbW04BTLLQC+G+DPsa6uTID423EAftU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VG8cRU5Ir7UObXsPpgPK/438hxEU/2BNvbd+fjChxQm3RGCec7Ct5BIQrq2GNOa9dKxTU+6TfVgrqOnH7usEq/g9DNK4OuA1pAvz4iW4duYWekyZ1YYoqiYJPr5G5qcJ2d9xLgrl5TigyHPCAf4RPAea84of20lDQU8snMBCrMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OpAZ6SE7; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaedd529ba1so742557366b.1
        for <ksummit@lists.linux.dev>; Tue, 18 Feb 2025 21:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739944779; x=1740549579; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uElxjeT4hItqlbW04BTLLQC+G+DPsa6uTID423EAftU=;
        b=OpAZ6SE7xU7fe9RGHaOT34EV2Yihx2/OwZUd+aUiJuPPC85Q3o7/vW4MVTn4eie9ae
         RBib0qc7trmjr/lfCuANKKMuGn3yGyUTU5hA01cqWICA+XtT8DwaZlsY1sEDw4dMO0c2
         u9lXxcIqqO0plNYebJjFplKRv9Kbpkb7J/UwGCUZayDznwMQ/jiBvfHzQ67/QMyC+XAH
         pvWBiZw/GyfXqmmA7Yy+e8jmroMLukTFCgAcUCcnbfHTjoGjwBVTqcWuP0JeoQ0t2X5a
         4cxjIpETLw601+CvwpCWwWNZEK+HwdEa3/tigFKDqGFlJaQw6PbtB9ZQ+Sbc+kIIuCIa
         vcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739944779; x=1740549579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uElxjeT4hItqlbW04BTLLQC+G+DPsa6uTID423EAftU=;
        b=Xi66jFokJIvW3BlTzdpp8xFHC2Fb1SeF/4ms1IMKlnowsohxo4Smf8teuATpzrkgeV
         odGLxje6Xn1HXFh02oL20eTwPGC9VS38asNvJWKxKGvNtJSZMubeWEXaa/99UmppGhyS
         rcdvkCGGyIZ6JdTGfI1+ej+PUsn/b34RFq106RX4ghSJQ+K1+rAYN+aWE/egQgnhqAdQ
         +4cMZ7s9XfL5qsNfRwPamSU5Ih5w+teBHQFsJ22LYYEWLtyU4PBUesJUoYOjlnr0FkYW
         sk8sG/i00lM+16Qe6tD5V4TNIPuMIVKuRns5E9Po6gW4J7E8H9P9FyVtQkmVx8CtziWB
         wscg==
X-Forwarded-Encrypted: i=1; AJvYcCXi6wekDDxKoOeFs1fAUI+mvPugFI0FuiwvhQujNU5GFINSALrUOAzP20c6mrxy2Bp3+CuLGobo@lists.linux.dev
X-Gm-Message-State: AOJu0YzDwMmZxLjcav9DmfXtJ1BTpfxgiQAmDZPQbhDbunwCRIcqSA4i
	kggVoJTU89YnVMIeCHjpySuOfTtbQJpkN61CWyxsyS5IPIUn7iK6HI9ArzaEl2PEqUWeBO2xK+S
	zX+sWYkdwLtm8SkgzO+IHc4fWv7I=
X-Gm-Gg: ASbGncucRwfI7iWKji/buONm7GqRZpNHLpDiSwuHbfzIJ005h8NFA8fbYYOQzwwhNOq
	2KTJFTpQ/1SfFxTDxcefD5Qho3RjKrCnkb2cRwl8yMV/hrrb4BdLHxQkMrVlUu2Wp7Ua2f2I=
X-Google-Smtp-Source: AGHT+IHf4yNl/lSglIrOWZ7tmy7DCI/C6vKYCZbWJ9e/970OUdAdTYVDcnQGlKd463dGyvBmjNpnQe7qZ9a4VXeSxzo=
X-Received: by 2002:a05:6402:430f:b0:5df:b6e1:4690 with SMTP id
 4fb4d7f45d1cf-5e03602e5eemr45126801a12.12.1739944779488; Tue, 18 Feb 2025
 21:59:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org> <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
 <326CC09B-8565-4443-ACC5-045092260677@zytor.com> <CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com>
 <a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com>
In-Reply-To: <a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 19 Feb 2025 15:59:27 +1000
X-Gm-Features: AWEUYZnB0Uf80ixJrp1q3PtuTwheEh6E-d43yX7BPT95rhn-uR-FN5lupp-eR5o
Message-ID: <CAPM=9twZYgp4skmHCcpRr4z8pne-3LN=J=Dan-sEAwJEpttXSA@mail.gmail.com>
Subject: Re: Rust kernel policy
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 19 Feb 2025 at 11:00, H. Peter Anvin <hpa@zytor.com> wrote:
>
> On 2/18/25 14:54, Miguel Ojeda wrote:
> > On Tue, Feb 18, 2025 at 10:49=E2=80=AFPM H. Peter Anvin <hpa@zytor.com>=
 wrote:
> >>
> >> I have a few issues with Rust in the kernel:
> >>
> >> 1. It seems to be held to a *completely* different and much lower stan=
dard than the C code as far as stability. For C code we typically require t=
hat it can compile with a 10-year-old version of gcc, but from what I have =
seen there have been cases where Rust level code required not the latest bl=
eeding edge compiler, not even a release version.
> >
> > Our minimum version is 1.78.0, as you can check in the documentation.
> > That is a very much released version of Rust, last May. This Thursday
> > Rust 1.85.0 will be released.
> >
> > You can already build the kernel with the toolchains provided by some
> > distributions, too.
> >
>
> So at this point Rust-only kernel code (other than experimental/staging)
> should be deferred to 2034 -- or later if the distributions not included
> in the "same" are considered important -- if Rust is being held to the
> same standard as C.

Rust is currently planned for non-core kernel things first, binder,
drivers, maybe a filesystem,
There will be production kernel drivers for new hardware shipping in
the next few years, not 2034 that will require rust to work.

Now if you are talking about core kernel code I don't believe anyone
has suggested any core piece of the kernel to be written in rust yet,
when someone does that we can make more informed decisions on how to
move forward with that code at that time, but otherwise this is just a
theoretical badly made argument.

Dave.

