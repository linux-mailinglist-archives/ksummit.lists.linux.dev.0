Return-Path: <ksummit+bounces-1863-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B18A4A40FCA
	for <lists@lfdr.de>; Sun, 23 Feb 2025 17:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2CFE17551E
	for <lists@lfdr.de>; Sun, 23 Feb 2025 16:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E97812CD88;
	Sun, 23 Feb 2025 16:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUIQsGHf"
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644CA25776
	for <ksummit@lists.linux.dev>; Sun, 23 Feb 2025 16:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740328928; cv=none; b=VAW0bHPGqWKyqf+1JJ18jn9CEWUnbh9HPji5tmJBsEq5NljKRqBlIybkWGXT1xEFxPnJszjCUbGIHMs+YdMMh0DmWzdruOaMizal3dQfuNzLeyT2Th6fBm/UokvjOiOmiNCKIFzTJSXSKPOGGzNuLArlMnkPKiIuarcQ5ErnxBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740328928; c=relaxed/simple;
	bh=iH0RTEfYSIc65pUhd2cqJOtJ4XewpQvlxlkaoIEIQWM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N5qlIvCHBTqYKA9yG2xiOxJqoGIdPeK5DPr939V0IHIk3slJdV7qRxyxCBDy+23ub5RsAXLtsJTzocQEdmy+oJBOSvn3mxDHwjIC9EwkXpsC3H3BOOb33Ckri05rOlLD7vq9TRtCQSWvspuMfEYl152c/NMfUn2o8RjhX8GHxBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hUIQsGHf; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43989226283so24414635e9.1
        for <ksummit@lists.linux.dev>; Sun, 23 Feb 2025 08:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740328925; x=1740933725; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxNewYB9W7yZGVWnL7Rq8e0t5q3ZmDQjfdFwbmexFXk=;
        b=hUIQsGHf/lEp/Owdf1mLE0srFnTVl49JMQNaLx/I+bbkttrwGfOuHZx6cVJjejEp/1
         PWoTCj10s+br7eKdgZ0su6WoRQ0XrB9NuswmEkHBT29VYvr+WwTRI9g6p3NcWAcHOZVq
         h1H4A39ays2cbfEw1TLVyKrBfFnht/Ba4xrK8u+j2Lq/Eeg0ed2PKnx8q1+4IbKYhK0s
         bf2HhJBKQ7EjgVB1nAIVoNsW6JM1NLVcmL7pVu0pmNtgm16yJZ1cH8GFRkuSlPD1qd7w
         2a8bHH+dmVfb7qbhfUseOmXjSmxhdq2zxveHthCQWTvpP7GGncRRgo92EFQs9gNajgqx
         5qnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740328925; x=1740933725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxNewYB9W7yZGVWnL7Rq8e0t5q3ZmDQjfdFwbmexFXk=;
        b=uDHRutOkZWkDk+UY7ic2gQLR1moMtvdzGTbEb1VCvOqO6WUOlwqT2XFr5lAX3r/m1P
         dfXwRAqw/2q5DTPNYLxtA5cWDWoYaZIK+kxdvesLfPFwzukcY8ZBp1hFIzT48C0utb4+
         u2i45yWgfzDgQLqhAk4UVnWUSRk9YLIj4itAd5Sy1oiaLqv/t/UYMCdUy7dP5znRNo4x
         V6TDN1/+QEbbCLciLjS4KSilCn8eAJSlpuU3Okf/nUwh6kj/oPWczFXH1E20F3TnWxD5
         AU5V4xekItGrFSNksn1wWHj2HqLY7F2AdRB/xCIgyL/Qw2s40eg55qyqmZso4n522KO6
         i98w==
X-Forwarded-Encrypted: i=1; AJvYcCVimqsCyg9RNQ8uSMmuNgmLP632uPzeJXjkS2MCgHtptGP3osn4UXUz1lOuWILWNzU1fgfldCmE@lists.linux.dev
X-Gm-Message-State: AOJu0YwGtVv2LvlWzak/wbkF3zccVDwB0oTNDIZ4l3Fk6DjuZm7fOMy5
	bnFcFPbSu3VTkGvHpRSfz30j9129mO4xG8hWH1mucihNexnvsIa+
X-Gm-Gg: ASbGncs5aB0yyZTpn6HnDMRVYdXNygBjh1MaN5otusoDq3SZDQjkb7ACxlNvhCZqlG+
	6BOiFhlvzjA5dkqy4HVmoC+RTx2VpP9tmH4LM8RSQiGOA6wZl9SmWSTF9wjtG4dVR/xtINA6g7t
	qY/z2AIkSg8a0t6VlUV1Ix+JiGclhswS4B8A1i+vCzqO9AXIIaaJalcBIqJVfGqnM0ZrWu+r8nh
	55zOCzTM1PECkwPInir4o1ggL/+MP3uiNJREaKCg3y91qD4iCqAHmGjBesAXYuqIyln+RXSAKzN
	opMldfs4uh9DWZsM+Jec2lfIQX4QsVZtko4HzfCO4rmuLZ53GUvLvmWOUMVoQ6Im
X-Google-Smtp-Source: AGHT+IHlXssYkIn+lrJDIexDFsyeWa8LiuwhIroMlUkUAi1TMAGlcv900iJiIwa30ux44Scu/nsQuQ==
X-Received: by 2002:a05:600c:1c13:b0:439:98b0:f911 with SMTP id 5b1f17b1804b1-439ae1e9aa8mr95801595e9.10.1740328924524;
        Sun, 23 Feb 2025 08:42:04 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b0367507sm82737345e9.28.2025.02.23.08.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:42:03 -0800 (PST)
Date: Sun, 23 Feb 2025 16:42:02 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Martin Uecker <uecker@tugraz.at>,
 Dan Carpenter <dan.carpenter@linaro.org>, Greg KH
 <gregkh@linuxfoundation.org>, Boqun Feng <boqun.feng@gmail.com>, "H. Peter
 Anvin" <hpa@zytor.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, rust-for-linux
 <rust-for-linux@vger.kernel.org>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: Rust kernel policy
Message-ID: <20250223164202.550f14b8@pumpkin>
In-Reply-To: <CAHk-=wjQ94GipftbNo0PbfuUxFMXFyp2bWGJJPNUngyf17Ai8A@mail.gmail.com>
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
	<CAHk-=wjQ94GipftbNo0PbfuUxFMXFyp2bWGJJPNUngyf17Ai8A@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 21 Feb 2025 15:04:04 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Fri, 21 Feb 2025 at 14:23, Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > If I could just get a warning for this stupid mistake:
> >
> >         size_t ret;
> >
> >         ret = func();
> >         if (ret < 0)
> >                 error();  
> 
> Note that my main beef with the crazy compiler warning is that it
> literally triggers for *RANGE CHECKS*.
> 
> IOW, it's literally the "if (a < 0 || a > XYZ)" thing that absolutely
> MUST NOT WARN. EVER.  If it does, the compiler is broken.

The other one is where it already knows the code is being discarded.
I suspect it even warns for:
	unsigned int x;
	if (1 || x < 0) ...
You can't even escape with Generic (a switch statement based on the type
of a variable). All the options have to compile with all the types.

	David

