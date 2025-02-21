Return-Path: <ksummit+bounces-1805-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C119FA4007E
	for <lists@lfdr.de>; Fri, 21 Feb 2025 21:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E98B4283F8
	for <lists@lfdr.de>; Fri, 21 Feb 2025 20:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E8A253358;
	Fri, 21 Feb 2025 20:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IuwmtvfJ"
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EE01FF7CC
	for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 20:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740168716; cv=none; b=o/YVQEU1J9YKj/PcMz1twnYEdEqI5CrKTBjo9xNHgYrNTQN8wVEIciiEQi0zwwAOFrzc5Lo9V4X/XoS0SrR+aBwvnD7OOLq0ai15bB3kphPRNvYEqJMzNAPnMIbCAcWhK6RxQYpY5csi5Xij87l2qNk3v/Q87Z9KgXPqKlexIaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740168716; c=relaxed/simple;
	bh=sHDT7bse50uCAtNjA78tyEQ3rjAX9mJG1DMhp6e+0tw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HOV76dNlGV20xXxJp9NMlwuWk5BL4O3HG1iEE6nihRbjFzPpfcL6z074SAR0lYuInbjbT9Gy2cyQck3OPsrL+pwi7jBK0Pa4E8kGZVhMO/mFOeRbY6uN0HLh2sUAKbl3L4LZEXVYtuMmparvttUcMbxOYVAa5Sqf+IfuTFBgxvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IuwmtvfJ; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5dee1626093so6560570a12.1
        for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 12:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740168711; x=1740773511; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CcGCG2WSdQQovy8qS/ohnfSZbfooRumEZHN+xZ7cilE=;
        b=IuwmtvfJ/PW1aXC+LNW2otd3MLuUnE1/IeWSFjbzROZmjjqLO6yJz+7vFbRuBG/VcC
         L5LfAp8R8zBVT8hPZ+wh4mj4h/RJY7iFgYl7wOm/8jKlLTE4QInAFndRfhYlBiukgHBD
         b0EuaPN3XE1KIjzYQLAKMo2WLtGgMHIzudbwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740168711; x=1740773511;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CcGCG2WSdQQovy8qS/ohnfSZbfooRumEZHN+xZ7cilE=;
        b=wQGd+EyZS9KeqLQxPGCPXtKFMq7ZfZeP3SfBEboBhNV5isgQubIluy71NtXaITKm3x
         XqkrW7bWwyqZCWn16Z/mM6few4rFAFaZcKfptgXV487RUVkP7NqWJLX+aS5E1MGe/uki
         0rWKS9Qj8KSMmIszkjvYo+/Cq2te9NwI3CM5cphffP7RwLEXJ6Rj0F/Xb7u4wUv+071g
         OiuK671osMR32ClMdb193eKfvNtb7iQkkmlJKgQZ3VCxWHROm4aXg3UioqAxxhKwTNMh
         FS67vdBgyQRHmQmp9QoFHwDha84wVYDu+1cBrEFy75JsEZZC54b2bOmYnifHCCstJvBp
         pxVg==
X-Forwarded-Encrypted: i=1; AJvYcCVmkKNWBa+FWVGZ6E0dtehujxSFvuyz73z4GZAGwHBRMf8mM3VE4ZMHK2ujizop4iNhn4FTWlAu@lists.linux.dev
X-Gm-Message-State: AOJu0YzSQRiclkqJcvxstSafMO0+/TFgWNkCWgntPQVpCKHxexyseVQ+
	LEaKf2rf0+KEVh8e1YymW4Pn19wSkOC+tBz+U0rz96/U/1x+i3+6V9eTChPk4Yuudp/I9P2amw3
	D1Gc=
X-Gm-Gg: ASbGncuwWF9nUenq2Be/Qcg3seOMyOwTxU3tMyo461u7681HxmKMmyv7n6olyqBz3E7
	ANc3VIHBHq+z2gALMQ7Ryk0c/IYcNKYuuhPZFmkUZXLV04D/siiqoiI1vg+aXvSJlm9BtyaIjMP
	u5hdoLXuKu0LPyNFN41a2BTb9izOLZx05e4IMHDPs709fP0JyHKNcAs2yfXYpQHlbjAfdlJRWru
	YDsQkTP8drYcqABwOhe2uQeStqhWTut7QiJ/6AAW8SgFr1ljeN/2pxE+03mpJHRGfMgZpbMANKI
	kX8jzDU4UHj9DkdAMeD+LCOKgBpMCIbKQltYMRPuKp9zH+MNG8pyY+39SvLRuT3RjTYRDs0xulb
	R
X-Google-Smtp-Source: AGHT+IHTWKtJx1io0OS0DUpvni42fq4gj2aEKL+FmCyQ+FXL9qVsEmE4bt9/2vsJzi1vUFMVhGY6qw==
X-Received: by 2002:a17:907:9989:b0:ab7:d66f:c872 with SMTP id a640c23a62f3a-abc0b037870mr400314666b.19.1740168710995;
        Fri, 21 Feb 2025 12:11:50 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8190d1b6sm1224492466b.36.2025.02.21.12.11.49
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 12:11:49 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-abbdc4a0b5aso468117166b.0
        for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 12:11:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXvRPycoWBSqrzl6+gIcQZ8y3IY7csv5l1/gVlc1o9O61taqlsVO9xVhTtU/65iIq0lJ6Qp3vJv@lists.linux.dev
X-Received: by 2002:a17:907:9989:b0:abb:daa7:f769 with SMTP id
 a640c23a62f3a-abbed5b21b4mr870873866b.0.1740168709416; Fri, 21 Feb 2025
 12:11:49 -0800 (PST)
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
 <20250221124304.5dec31b2@gandalf.local.home> <CAHk-=wgg2A_iHNwf_JDjYJF=XHnKVGOjGp50FzVWniA2Z010bw@mail.gmail.com>
 <6b3e4d3bdc9b6efd69068e5b22cfd05d370aed19.camel@tugraz.at>
 <CAHk-=wg=pZvE9cHJUPKGCajRUCtDoW73xwY5UfJApCWms_FgYw@mail.gmail.com> <008cc0939c130ee24fbc71a0407ff82772076668.camel@tugraz.at>
In-Reply-To: <008cc0939c130ee24fbc71a0407ff82772076668.camel@tugraz.at>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 21 Feb 2025 12:11:33 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj5Rt_xhp_n4_gEyGG9LKFOiTrsvN0ueo3q5PyjJPU+AQ@mail.gmail.com>
X-Gm-Features: AWEUYZnIN0fhlIm3BbR3TnvejgU7vmWR4MU8kuJXCz4EmowYIdocxYD5OpC83wk
Message-ID: <CAHk-=wj5Rt_xhp_n4_gEyGG9LKFOiTrsvN0ueo3q5PyjJPU+AQ@mail.gmail.com>
Subject: Re: Rust kernel policy
To: Martin Uecker <uecker@tugraz.at>
Cc: Steven Rostedt <rostedt@goodmis.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Greg KH <gregkh@linuxfoundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Feb 2025 at 11:59, Martin Uecker <uecker@tugraz.at> wrote:
>
> The standardized version of __attribute__(()) would look like
>
> [[safety(ON)]];
> ....
>
> [[safety(OFF)]];
>
> which is not bad (and what C++ seems to plan for profiles),
> but this also does not nest and is a bit more limited to where
> it can be used relative _Pragma.  I don't really see any advantage.
>
> GCC has
>
> #pragma GCC diagnostic push "-Wxyz"
> #pragma GCC diagnostic pop
>
> for nesting. Also not great.

I realize that the manual nesting model can be useful, but I do think
the "default" should be to aim for always associating these kinds of
things with actual code (or data), and use the normal block nesting
rules.

If you are writing safe code - or better yet, you are compiling
everything in safe mode, and have to annotate the unsafe code - you
want to annotate the particular *block* that is safe/unsafe. Not this
kind of "safe on/safe off" model.

At least with the __attribute__ model (or "[[..]]" if you prefer that
syntax) it is very much designed for the proper nesting behavior.
That's how attributes were designed.

Afaik #pragma has _no_ such mode at all (but hey, most of it is
compiler-specific random stuff, so maybe some of the #pragma uses are
"this block only"), and I don't think _Pragma() is not any better in
that respect (but again, since it has no real rules, again I guess it
could be some random thing for different pragmas).

              Linus

