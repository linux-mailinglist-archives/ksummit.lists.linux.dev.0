Return-Path: <ksummit+bounces-1762-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3CDA3DE62
	for <lists@lfdr.de>; Thu, 20 Feb 2025 16:26:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A00B17F9D5
	for <lists@lfdr.de>; Thu, 20 Feb 2025 15:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0C8B1FDA9D;
	Thu, 20 Feb 2025 15:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xM17cNZa"
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789261D61A3
	for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740065125; cv=none; b=oJOtQoiWJJvXk1AVx+C0ANHIXWvQ5ZcrboSsYS/8zEeGHLJMBIam2JlqVDxOijAjFlJfmW5n/fjCjjdgdEEH5E/Ppb4jQwDPfEelpScPKpOv8E/81aamce+Yz9w6x5I80cCFV6MdKhnrO3RL3cjRkc1IzN11BMDDUAPCZd+R+/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740065125; c=relaxed/simple;
	bh=b47NjgCOmrDA1ny3RT/sxN6i21ieTBe2znfwf8X3+l4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7W06F/T0RZGCM6W+JPWvMzL4w4zZhNyYMEleIcjabn3btNThnUrOFtvxNctTA1sqg5f/m+rgeKDk2PpALTMPtV42/aVNlLO6tJSftlsQqBJ3deINd2k+80n6dGreMWmEceo8pTKU4mrhHx5sTKoi3WBxLGoZe4P+uDO8JPWLbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xM17cNZa; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e08064b4ddso1494592a12.1
        for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 07:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740065122; x=1740669922; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rzc2bRExbKxZ8DpMS7TyI/zDTW4gUm/2Sk3pZDw0IWc=;
        b=xM17cNZa+QgFNJX1YSnd+TfMmbuPwWkTv0uhAe0kdqWAOropngDgkDhotd18apEfBv
         NW+w6jK50BSV91rnsuLGXL2nlg+iBUdCopTkXzz0mdZBrjVIHHCbvK8J2Z0k9XjdPVuj
         ZiIihHnD9CTQeoq/h079KXtl2vNj3m/aJ1b6mdz0Ui0odh9dqLvngDCtq/wFyhOSKdmF
         L53Jgw1as0+JPTutfBGDZsF/mGTa9H/JTRGTIogf5+68dbfyYBGtPB8+jNk6+HihNQ+/
         7kkGfqECVsjHRgTPYLEqKROxkv4j5hesKQUV0R6hUUZx5iqVLPskk5an5NaBEqTzTopS
         zBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740065122; x=1740669922;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rzc2bRExbKxZ8DpMS7TyI/zDTW4gUm/2Sk3pZDw0IWc=;
        b=WqQ50+HGSYXyKWZoZE4Bzhg7GxRCLYQkM90rHGB1c+RnqDIdPUD50bNSzFdOGQ54Fw
         iyhgTJYRSPqQwFziw1C/T3QsBge8hkKQXIwB5bpV8aazJ/gGTVWG0Q//rKGa5rv7GJaD
         k17cc8YamLPCwTZZalTr+zb5khY73a3dZ/6NmMJUX+TAWqBh4n/dQuF1q7ppTQJZ0WUR
         je3ziTXIfSzDRJ4iTcr1NMcp73I4hY+NKL3I1i7g9iFOnO1A1t6aHXSxt5WfcJjtbn8G
         lTvCUnhOL7P4hzxpHHXQPkfx9MC4bs0KxdP6QH+HCRDGQlsAHH2HTOju/HNGd7XnSOsc
         KT5g==
X-Forwarded-Encrypted: i=1; AJvYcCX7fsBbOpB5EO7YyNVQpjVB+GJBqsygwl3OIvG2V5bh4IJpbcl6aj0wPJDqnrHCiOhnYOCqc6Eh@lists.linux.dev
X-Gm-Message-State: AOJu0YyQzBH9Hq9pRMyqbhcDHioJWQxrPJDQhFpxpcSJ59k57ndoapIz
	9Kci8ipVYsba2Oq9HDfsxhOnG7OgSuDPlR/lKgYnOX1k5QILWv2/Y+EfXyJMsOY=
X-Gm-Gg: ASbGncvWMNXx2k1OZZyFtrS/6Bvliik+Au4kyBtrHXRMEK9+GqjuueF9E/c6LLmaMyt
	8MArIDZNicsQFFmGuZCoAACc7TVjagwiEvGsl5lT7EC87kgI0y/5qNflSddJQF5MAtzlxGQL8mO
	vvupJqioudYbwE2UNwIMn3XSCkQ2NMKHqvz/OlNzNabV6EDsbBIsCFJvFAu5/lpqMpjcfVU5l26
	9lxbOrZzoLgMOXpEMZnE2zfyOl+A3sfPgiZUx8rarZJHfkmx1jJONV2wv3OJ+s4pYKoi4o/+E7u
	C1WsDLvp++11UgX14job
X-Google-Smtp-Source: AGHT+IF4V7PCysU68JDjvDTqW9RwYggW3E/vYq+QTLI8ffd9Mxu1oKY8PfB2r6dneFImEjALVE4tbg==
X-Received: by 2002:a05:6402:3583:b0:5de:e13c:39bb with SMTP id 4fb4d7f45d1cf-5e03601ee87mr19818602a12.4.1740065121715;
        Thu, 20 Feb 2025 07:25:21 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5e07f390626sm4091147a12.30.2025.02.20.07.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:25:21 -0800 (PST)
Date: Thu, 20 Feb 2025 18:25:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Martin Uecker <uecker@tugraz.at>
Cc: Greg KH <gregkh@linuxfoundation.org>, Boqun Feng <boqun.feng@gmail.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
	ksummit@lists.linux.dev, Justin Stitt <justinstitt@google.com>,
	Kees Cook <keescook@chromium.org>
Subject: Re: Rust kernel policy
Message-ID: <84950d6c-55cc-42ca-9cd7-884e6723b235@stanley.mountain>
References: <326CC09B-8565-4443-ACC5-045092260677@zytor.com>
 <CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com>
 <a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com>
 <Z7VKW3eul-kGaIT2@Mac.home>
 <2025021954-flaccid-pucker-f7d9@gregkh>
 <4e316b01634642cf4fbb087ec8809d93c4b7822c.camel@tugraz.at>
 <2025022024-blooper-rippling-2667@gregkh>
 <1d43700546b82cf035e24d192e1f301c930432a3.camel@tugraz.at>
 <962fa158-5315-4d93-afb1-8a1c08787ad8@stanley.mountain>
 <1f31a16d3898e0e9b5d94f9bcc12a1b73ac97982.camel@tugraz.at>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f31a16d3898e0e9b5d94f9bcc12a1b73ac97982.camel@tugraz.at>

On Thu, Feb 20, 2025 at 03:09:21PM +0100, Martin Uecker wrote:
> Am Donnerstag, dem 20.02.2025 um 16:46 +0300 schrieb Dan Carpenter:
> > On Thu, Feb 20, 2025 at 09:57:29AM +0100, Martin Uecker wrote:
> > > In particulary, I have a relatively concrete plan to have a memory safe
> > > mode for C that can be toggled for some region of code and would make
> > > sure there is no UB or memory safety issues left (I am experimenting with
> > > this in the GCC FE).  So the idea is that one could start to activate this
> > > for certain critical regions of code to make sure there is no signed
> > > integer overflow or OOB access in it.
> > 
> > I don't think diferentiating between signed and unsigned integer
> > overflows is useful.  In the kernel, most security issues from integer
> > overflows are from unsigned integer overflows.  Kees says that we
> > should warn about "Unexpected" behavior instead of "Undefined".  In fact,
> > Justin Stitt has done the opposite of what you're doing and only checks
> > for unsigned overflows.  He created a sanitizer that warns about integer
> > overflows involving size_t type (which is unsigned), because sizes are
> > so important.  (Checking only size_t avoids probably the largest source
> > of harmless integer overflows which is dealing with time).
> 
> I agree with you.  We were also discussing an attribute that
> can be attached to certain unsigned types to indicate that
> wrapping is an error. 
> 
> My more limited aim (because my personal time is very limited)
> is to define a memory safe subset and in such a subset you can
> not have UB.  Hence, I am more focussed on signed overflow at
> the moment, but I agree that safety in general must go beyond 
> this.
> 
> But this is why I want the kernel community to be more involved,
> to get more resources and more experience into these discussions.
> 

In the kernel we use the -fwrapv so signed overflow is defined.
I used to have a static checker warning for signed integer
overflow.  There weren't many warnings but everything I looked at
ended up being safe because of -fwrapv so I disabled it.

(This was some time ago so my memory is vague).

> > 
> > The sanitizer has a list of exceptions like if (a < a + b) where the
> > integer overflow is idiomatic.  But the concern was that there might be
> > other deliberate integer overflows which aren't in the exception list so
> > Justin also created a macro to turn off the santizer.
> > 
> > 	x = wrapping_ok(a + b);
> 
> Indeed. This is the main issue with unsigned wraparound. Exactly
> because it was always defined, simply screening for wraparound
> yields many false positives. 
> 
> (BTW: Rust is also not perfectly immune to such errors:
> https://rustsec.org/advisories/RUSTSEC-2023-0080.html)
> 
> 
> > 
> > What I would like is a similar macro so we could write code like:
> > 
> > 	x = saturate_math(a + b + c + d * d_size);
> > 
> > If anything overflowed the result would be ULONG_MAX.  In the kernel,
> > we have the size_add() and size_mul() macros which do saturation math
> > instead of wrapping math but we'd have to say:
> > 
> > 	x = size_add(a, size_add(b, size_add(c, size_add(size_mul(d, d_size)))));
> > 
> > Which is super ugly.  Maybe we could create something like this macro?
> > 
> > #define saturate_math(x) ({             \
> >         unsigned long res;              \
> >         __trap_overflow(label_name));   \
> >         res = (x);                      \
> >         if (0) {                        \
> > lable_name:                             \
> >                 res = ULONG_MAX;        \
> >         }                               \
> >         res;                            \
> > })
> > 
> 
> We added checked arhithmetic to C23, we could add saturating
> math to C2Y if this is needed.  (although I admit I do not fully
> understand the use case of saturating math, a saturated value
> still seems to be an error? Statistics, where it does not matter?)
> 

Normally, you pass the resulting size to kmalloc() and kmalloc()
can't allocate ULONG_MAX bytes so the allocation fails harmlessly.
Where with an integer overflow, you do:

	buf = kmalloc(nr * size, GFP_KERNEL);
	if (!buf)
		return -ENOMEM;

	for (i = 0; i < nr; i++) {
		buf[i] = x;  <-- memory corruption

The buf is smaller than intended and it results in memory
corruption.

> In general, if people have good ideas what compilers or the language
> standard can do to help, please talk to us. It is possible to
> improve compilers and/or the language itself.

Thanks so much!

regards,
dan carpenter

