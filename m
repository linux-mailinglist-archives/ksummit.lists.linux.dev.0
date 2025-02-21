Return-Path: <ksummit+bounces-1793-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EB7A3FE47
	for <lists@lfdr.de>; Fri, 21 Feb 2025 19:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36625706078
	for <lists@lfdr.de>; Fri, 21 Feb 2025 18:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723F72528F6;
	Fri, 21 Feb 2025 18:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GzgsMuGX"
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C642528E0
	for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 18:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740161285; cv=none; b=SkLZqMYP4vpDoTfRqTxZ6mU5TlviS11QRFW0ByvgbEBTsFsQWQaNfyH+CR46eDBIsHFkiu1TgRCmP2i1ckr40D7Lf0KCCirt4122m1eoAG0QljpXFCZjufr+YgAPolnYHCqmUE4VZjyA/Z9GFYltRds0uv+9upjJzUUqKI/GbvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740161285; c=relaxed/simple;
	bh=EAsGt2EqyVTOElAZitReGYYY5iRcKkQxdM7stcUnkZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KJxIYwzhHJIwSmG/vEFZOIlrOcHvJ1vTFM3r/SHrb884UNadaOR0hz7GKy6o3BWareAzAHyljs+PBjRsrvIBG+8/60qPbsuDHhHExSNTHZ63AkXgNcd09FlSB1gLmHcF5IlU6Ix1+LfVgFQXSQKxIpd7W31weAnM0pvq5LGansY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GzgsMuGX; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaeec07b705so384640166b.2
        for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 10:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740161281; x=1740766081; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0AG1owJnX9rC5c7qxcIfiTiPqKW23h3ZpuLUTgVKvNY=;
        b=GzgsMuGXTan7D5xELNtCkiiVzU3Ob623rFeMO1uVpLTtL+cwtpsbSUHkIJJqUzWaF6
         OcZPqmOhnHVay1W5xErH9XczafrMTJ/PtJ38AytEue9+olSHMo9zJ/oN2r+RBkIFa83A
         oLjJffYFVE6h8aIQVDevaXuvZEWQIIsi53CFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740161281; x=1740766081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0AG1owJnX9rC5c7qxcIfiTiPqKW23h3ZpuLUTgVKvNY=;
        b=UVAHVEhdf0w1c371tQoApugqV/GCOAYpotFXEmvKEInO/DurYK2PRgKKIuJFum7aD5
         2CvXqERzvwTvkeSmbOHnAmovJ/uoAdkaez2kqHYSi+BLTRlha0v+3zh9fJAoQwWiJo+5
         CSn5Np/huxe9yLXIXNo6RJAaZVK2/EGct9lJMiCYqjizgMRQMOUNpTGX75o8en3vMYR6
         P3t10R5PngrHb3KNIi8eMHzHJ9W8FZ68sg0C2zcuxCoCUa6g/v4wb4ftIxdg9q86VYvu
         RaJhIAmBqhqhI8jEqpHuRbXQDt9TShDiY9YcdYoClDUTDM2nF3eFO2tnvyqya1XkTxfD
         /RnA==
X-Forwarded-Encrypted: i=1; AJvYcCUHHIEGpj25r1ajE2943S8LBiO4gpVEHf6lhePtqTZp2LUfSKd76j2NY5oHGqTwanXkC5x2fVtE@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8MtV/k4A3LqwvXyIFfdhos0d/nTeRjxEVx97c84vNAyd21ZGa
	Zv7rmI9lsz0nobm+tBgi/q1hQKldGCGwhfNxYRSIlpnMoWJMpb20wOSkm0N/GNW5vEw0J5y0E18
	r8KA=
X-Gm-Gg: ASbGncs3TJp+ICejWmhTdWY1nIJdoCw5voAjq+bq6RQi8Vt71X3pb/Tb1VkHnG+Lekh
	D+4sUmeSr9flUfhRRVd3+/kz51MBhTUtX7+ZsrmS2ylofKUAJhSehPE1nXUOZqV2rucS5Y/VUcj
	nrk+XzRkKmVXR9BtAKTz7a8PMc+5Nle8NgXMr5+klAFgMtbo/04ngrXqxrjBgIw8Ojx7GXifW7V
	ylwKzSh12UFEOgIWPv8zHKB47HCSe3rJw6TvKAr3Idjva2W+3u4muT//kSsXsypgNz4GIBvy3Kb
	TNOye7Pib/bBdrEUrBg7yL76MbSjRVr2bDlvXs6TFqs3zQvKgfsCeUeW3zPq0Oaa7tYdic2T6mU
	5
X-Google-Smtp-Source: AGHT+IHw3P8SQ547qQvaTLZBQjetJtQibPlt5Kp6vwEFR/sDgZKOxiQ1+Ui5oAgqdlwB/OH4lm1Hgw==
X-Received: by 2002:a17:906:c106:b0:aa5:225f:47d9 with SMTP id a640c23a62f3a-abc0da3363dmr397095066b.29.1740161281290;
        Fri, 21 Feb 2025 10:08:01 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb925bbb1fsm1087974866b.70.2025.02.21.10.08.00
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 10:08:00 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-abbda4349e9so348339566b.0
        for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 10:08:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWGWstsSTMv7u19i0wpFIIAn8IOSW+JzDk0H1G+UMGn3YlF2thKSRqcFehfeWZIHNt5J1BIgD4c@lists.linux.dev
X-Received: by 2002:a17:907:7eaa:b0:ab7:5fcd:d4d9 with SMTP id
 a640c23a62f3a-abc0de0e4d6mr364513766b.43.1740161280179; Fri, 21 Feb 2025
 10:08:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <326CC09B-8565-4443-ACC5-045092260677@zytor.com>
 <CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com>
 <a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com> <Z7VKW3eul-kGaIT2@Mac.home>
 <2025021954-flaccid-pucker-f7d9@gregkh> <4e316b01634642cf4fbb087ec8809d93c4b7822c.camel@tugraz.at>
 <2025022024-blooper-rippling-2667@gregkh> <1d43700546b82cf035e24d192e1f301c930432a3.camel@tugraz.at>
 <2025022042-jot-favored-e755@gregkh> <b9a5de64fe1ded2ad3111763f35af9901bd81cc4.camel@tugraz.at>
 <caea3e79-78e6-4d98-9f3b-f8e7f6f00196@stanley.mountain> <61a7e7db786d9549cbe201b153647689cbe12d75.camel@tugraz.at>
 <20250221124304.5dec31b2@gandalf.local.home>
In-Reply-To: <20250221124304.5dec31b2@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 21 Feb 2025 10:07:42 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgg2A_iHNwf_JDjYJF=XHnKVGOjGp50FzVWniA2Z010bw@mail.gmail.com>
X-Gm-Features: AWEUYZmQJ76LofvaADGYz9wDxturcIzFXn8JOYMJIs8qre83YpKfkEfOvP9lwxA
Message-ID: <CAHk-=wgg2A_iHNwf_JDjYJF=XHnKVGOjGp50FzVWniA2Z010bw@mail.gmail.com>
Subject: Re: Rust kernel policy
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Martin Uecker <uecker@tugraz.at>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Greg KH <gregkh@linuxfoundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Feb 2025 at 09:42, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Because they are arcane and even the gcc documentation recommends avoiding
> them.
>
>  "Note that in general we do not recommend the use of pragmas"
>  https://gcc.gnu.org/onlinedocs/gcc/Pragmas.html

Yeah, #pragma is complete garbage and should never be used. It's a
fundamentally broken feature because it doesn't work AT ALL with a
very core piece of C infrastructure: the pre-processor.

Now, we all hopefully know that the C pre-processor is the _real_
fundamental problem here in how limited it is, but it is what it is.
Given the fact of how weak C pre-processing is, adding a feature like
#pragma was a complete failure.

So gcc - and other compilers - have figured out alternatives to pragma
that actually work within the context of the C pre-processor. The main
one tends to be to use __attribute__(()) to give magical extra
context.

Yes, yes, some kernel code ends up still using pragmas (typically
"#pragma pack()"), but in almost every case I've seen it's because
that code comes from some external project.

We do have a small handful of "disable this compiler warning" uses,
which isn't pretty but when there aren't any alternatives it can be
the best that can be done.

But *nobody* should design anything new around that horrendously broken concept.

> Actually, I would be perfectly fine with fixing all locations that have
> x < 0 where x is unsigned, even if it's in a macro or something. Those
> could be changed to:
>
>        if ((signed)x < 0 || x >= 10) {
>
> If they want to allow unsigned compares.

Absolutely #%^$ing not!

That's literally the whole REASON that broken warning is disabled -
people making the above kinds of incorrect and stupid changes to code
that

 (a) makes the code harder to read

and

 (b) BREAKS THE CODE AND CAUSES BUGS

adding that cast to "(signed)" is literally a bug. It's complete
garbage. It's unbelievable crap. You literally just truncated things
to a 32-bit integer and may have changed the test in fundamental ways.

Sure, if the *other* part of the comparison is comparing against "10"
it happens to be safe. But the keyword here really is "happens". It's
not safe in general.

The other "solution" I've seen to the warning is to remove the "< 0"
check entirely, which is ALSO unbelievable garbage, because the sign
of 'x' may not be at all obvious, and may in fact depend on config
options or target architecture details.

So removing the "< 0" comparison is a literal bug waiting to happen.
And adding a cast is even worse.

The *only* valid model is to say "the warning is fundamentally wrong".
Seriously. Which is why the kernel does that. Because I'm not stupid.

Which is why that warning HAS TO BE DISABLED. The warning literally
causes bugs. It's not a safety net - it's the literal reverse of a
safety net that encourages bad code, or leaving out good checks.

The thing is, a compiler that complains about

         if (x < 0 || x >= 10) {

is simply PURE GARBAGE. That warning does not "help" anything. It's
not a safety thing. It's literally only a "this copmpiler is shit"
thing.

And arguing that us disabling that warning is somehow relevant to
other safety measures is either intellectually dishonest ("I'm making
up shit knowing that it's shit") or a sign of not understanding how
bad that warning is, and how

This is non-negotiable. Anybody who thinks that a compiler is valid
warning about

         if (x < 0 || x >= 10) {

just because 'x' may in some cases be an unsigned entity is not worth
even discussing with.

Educate yourself. The "unsigned smaller than 0" warning is not valid.

             Linus

