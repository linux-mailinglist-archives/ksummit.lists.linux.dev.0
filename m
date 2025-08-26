Return-Path: <ksummit+bounces-2228-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1374AB374F5
	for <lists@lfdr.de>; Wed, 27 Aug 2025 00:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B71972A7D3F
	for <lists@lfdr.de>; Tue, 26 Aug 2025 22:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE7F2BEFF2;
	Tue, 26 Aug 2025 22:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="H7NAiI9Z"
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC502820C6
	for <ksummit@lists.linux.dev>; Tue, 26 Aug 2025 22:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756248275; cv=none; b=o/JqElHXp2vVPnRTA0WmG48wAe49DNgiWcUiQ+mWKTtdYBXBHK+HY0SFQwPr9KOcqMfQ+EaFTr6gO0wbF5IX+uB75GoOVhlitH5Eg/Bftv3KDUwapaoBEEBUR9/kiB8u/rcu32KmPVN9knZT/KQf6aEayAIE1ZqCMeMebS6BC3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756248275; c=relaxed/simple;
	bh=xDAPgRr19gN4GVduiWO9U6OlcEuRIbAXaqI7H+qagWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oPJSnmp9uWz4Izg74jY7yMQCuNFE/QW2bKQgiR/YDaFST2DpQRY4qz6JNqjLQCmW2N9dN7AN5qCsUICw8Hi+s1NgmFGW1tLHX/V6ZwxSbFQkAIIn8RxNie85glw1HNKNJzKeNdf0is8cv+YyF80J4JUF7nQ2ZKKLDzoUPTyCuI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=H7NAiI9Z; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61c3b84df28so5450975a12.1
        for <ksummit@lists.linux.dev>; Tue, 26 Aug 2025 15:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1756248272; x=1756853072; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CVHt6K78nnbnIpahuWeABmWlUNAC5KMV0wuTNcYcppU=;
        b=H7NAiI9ZtxdexusR6B+SVff1c3x5EN75QzmoH+iKKbRkl3MZFr4U2wDmghTWpHpz+D
         XBaVkPxnp9+JTBWUCcunFstDzGJVtAEGvtIa2wXWjtk2wbJN/2mXK2eTXxiWYZF4aCOR
         rL4H8FcQfZiJ2P86Uj0V8el964gDYa1TarEmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756248272; x=1756853072;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CVHt6K78nnbnIpahuWeABmWlUNAC5KMV0wuTNcYcppU=;
        b=NJwBTf6Rem6YUAO0LILkSfr8HQB3Hx1U5DYUtc5uF0PQOiJmuU1EiskovHlQYQEp8I
         8+b01GbEnOvQ+wJ5bCb4gC+x6sz930/gjbDyDZ8FqY/KbjV34OABhe5/bxbUzoCPasa4
         /gVoqJ1J4X2lg+NBJ5t4ndZySxIn3CmrWLXi9Q7RguUHMvUTLoEWyXHtJmpRLfKIYULf
         UdYQe7GAMnLfTsH0VfcTnmmh5naHb9AiCCAcJxL2XnWVtz3BSOwg9/n8TrzQeh10j1QH
         3pL4IWYjyCJWTtsam7r1EB5Ctm8iDcQJAj8/lbAbZUEyq9plAKkYzo+rMmt3Xw7OT0zs
         OmOg==
X-Forwarded-Encrypted: i=1; AJvYcCU2ok3+jyUbClIKH5D7uxHDUVUFJQ9EYqcJNDWdacJZiEZvOnB0ssBIyNzKQyVqi7FqkUE7qB45@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5qJAFE5UtV73ufUdD3qcKtTZidMPx80U5xnWXtAR9D5ohJuNg
	tIOvEgbNKzzVuaAkM+fasAREe2wftMNMdwsDlTrVuj5eJfy5FeADg4Z8rOd0LLtcVriKthgGd4g
	84JrIODM=
X-Gm-Gg: ASbGncsDBkMdf84QXbi3NQ6xQdQ9w+TYuHOdYgo0i+4IhPG37v81TN9aYlNB+vz7ELG
	9Dld4zXvi/kQLSAu4LW5Kxs6aAwQ5CLF70KQ+cwSZnykVMEMRyvLS9AAjRVNxhPuUXjPcC8Orrn
	DOsBmSfT1GrglhuF13Q1OzzJ1H9lSb5Mpm87YteXkPMEiWypfYD9MA54Ulr93o9f90fx2yg3Uc1
	l9p0U15l0gq+XZ7BuaS1xfN8ZMGZodjyKS3Qkt/JKbmm7WTasr0miLIFeMxajlAMZePZxHHW2is
	vyoWG4qAjWIwNwKoGqBukno1sITgTDqtMKKRwAJ4/KNDZV1D89DANpOa35Vf8LufYu+n60N+LT0
	uzv1gfDO+WxQaCknai88WQjdO0TgpmjfdZFfAyqsvH/3Nfu6wjZtCGmrs5InVXfl8x+Emf/dS
X-Google-Smtp-Source: AGHT+IFPFaT0eVrL/dirmYwWaQsPtcQ0JnKYVAOZpiM6AX+hIiSSIQ0CdDA3z07oGyrsgK73muuQ1Q==
X-Received: by 2002:a05:6402:5190:b0:61c:7f95:9b with SMTP id 4fb4d7f45d1cf-61c7f950875mr4943889a12.20.1756248271680;
        Tue, 26 Aug 2025 15:44:31 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c90ffd657sm2323586a12.44.2025.08.26.15.44.30
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 15:44:30 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-61a8c134533so12638368a12.3
        for <ksummit@lists.linux.dev>; Tue, 26 Aug 2025 15:44:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVzzYGtSq+V/wn0B8O4KfZiHO4O+WuTiga+rwOQaUTcZS98MeO/Ipm9b7l5Lax9VWS7M6VYLTIC@lists.linux.dev
X-Received: by 2002:a05:6402:1ecc:b0:61c:6855:d92d with SMTP id
 4fb4d7f45d1cf-61c6855def3mr7240920a12.31.1756248269646; Tue, 26 Aug 2025
 15:44:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACMJSes7ZnGo+Wyk_Db8VEUb8iXFB6-ev3hceY9aY1vjhpywTQ@mail.gmail.com>
 <CAHk-=wgOXd-meRuz5Gv2oz0W0wBUOpMO5CK9eifjfdR5Xz_-Fw@mail.gmail.com> <536or9s2-r219-2854-2n7s-q299s7q7noq9@xreary.bet>
In-Reply-To: <536or9s2-r219-2854-2n7s-q299s7q7noq9@xreary.bet>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 26 Aug 2025 15:44:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi2E0BBX1ZUEo5B5a0E+M_eFU_NgWgp+cABfsqR9f-cAQ@mail.gmail.com>
X-Gm-Features: Ac12FXxwnkl-zVSV-fQWHb4CeTSrs-qyjGMFk6z3zKYpReZOCIXtfojf6-slvIs
Message-ID: <CAHk-=wi2E0BBX1ZUEo5B5a0E+M_eFU_NgWgp+cABfsqR9f-cAQ@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] Enforcing API deprecation
To: Jiri Kosina <jikos@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Aug 2025 at 13:28, Jiri Kosina <jikos@kernel.org> wrote:
>
> > If you are not willing to fix up all existing users, and you introduce
> > a parallel API, then you are the one that maintains both the old and
> > the new API forever.
>
> I don't disagree, I just feel that it's important to note that it's pretty
> much impossible to do a proper functional testing of many such
> conversions.

Yes.

And I think the takeaway from that should be "think through the API
conversion before you go wild".

If you can't automate a good 1:1 conversion that is clearly a no-op,
maybe your new API is just complete garbage.

Honestly, if a new API is not a 100% obvious proper superset of the
old one, WTF are you doing?

IOW, if you are creating a new API that doesn't express the EXACT SAME
behavior as the old API did as one part of it, I think your new API is
likely complete and utter shite.

So the starting point should be that any new API can AT LEAST express
the old API as one situation.  If you can't do that, don't even start.

And then, as a second step, think about how you express the new API so
that it's _easy_ to convert with automation.

Exactly so that you don't have to test every single conversion,
because when it comes to most drivers, that simply isn't an option
when hardware access may be very questionable.

(In some other areas, you *can* test things - at least in theory,
architecture interfaces and filesystems should be things that you can
ask people to actually test, because there are only a handful of cases
- and automating it may not be possible anyway, because some new
architecture feature may require writing some new assembly sequence
etc)

And yes, I agree that a lot of API conversions have *not* been done
with those "proper superset" and "easy conversion" steps in mind. We
obviously have had a lot of parallel API's all over the kernel, some
of them living for years.

The biggest pain points are often semantic locking issues, and the VFS
layer kept those duplicate "locked or shared" operations around for a
long time - we introduced the 'shared' directory iteration back in
2016, and the locked version *finally* went away in 2023, so it stayed
around for over seven years..

But maybe sometimes the API changes are just too damn big in the name
of "let's get it right".

Perfect is often the enemy of good. Making the new API easier to
convert to, in the name of making for a smoother development model,
may be the right thing to do, even if maybe the new API isn't then
everything you would want it to be.

I suspect Bartosz comes at this from the recent GPIO setting changes,
and honestly, I do think that could have been done with a coccinelle
script originally, instead of doing a parallel API at all.

             Linus

