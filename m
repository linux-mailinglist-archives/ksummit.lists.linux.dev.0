Return-Path: <ksummit+bounces-2234-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 773F4B387E9
	for <lists@lfdr.de>; Wed, 27 Aug 2025 18:42:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86E69464525
	for <lists@lfdr.de>; Wed, 27 Aug 2025 16:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44BA62ED164;
	Wed, 27 Aug 2025 16:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZfzPQpc"
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7EC2E888A
	for <ksummit@lists.linux.dev>; Wed, 27 Aug 2025 16:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756312937; cv=none; b=TDwhGYL/8N0QIpaMLzm2UIy4yHXqPUOO8h3qhfRLI97iBjyqn5XuPqHOGA6+SxPbUnfZTDYX4wzUb2kShii9uaSweIber6XNIY/1xYK2x6X8oeO13jcNOPv5rICqwqMDHP9OSipy0EeNmB9XwEO8dCEjgKQB3TnONFkqEICoeWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756312937; c=relaxed/simple;
	bh=mVJn8wxiPOEf/yfUMBiFeypsZrm7YbFtuyWpFgOavuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n9mpqaU3PfNwi6mT9nP9bKAO0Fv+Nr31N25w8pnk6Jw8+PpGv0mETa4Yyrc54xlGOkzZT+cW05kHtmPPyAW1E3U/LRQVQH1GqRqrqlYC1f8dZTi+2KQCdRBvcAvnFwZ5i3jFk6RztVg3L6NJLGSMcfw2bh2n+ztI6s+7gWGrX2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZfzPQpc; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6188b5b113eso11241a12.0
        for <ksummit@lists.linux.dev>; Wed, 27 Aug 2025 09:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756312934; x=1756917734; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVJn8wxiPOEf/yfUMBiFeypsZrm7YbFtuyWpFgOavuo=;
        b=ZZfzPQpcKHyj47v4zryHsXOgY9T+lIHF6gyT8Io5oVLMo36zYmoyuIWKkb5p7uibQQ
         NrsTkcuctQszdIT6ll3/oK/BTpgdUtgQvyj2XrZCzmq6iOS3p4m+EfEZH+UJiw93ampZ
         inOiuSill75p7e2/5M1RxgqKYmpTOOwPbb0hqfUAQIiBaSIOT81Mj6B8IO+HBwi4DgTV
         A1XlOINntMz0sdbVZvCFSHPDcBKY2JZE0PlMKCsjp2wODviLEz87KjfjmKK95VhWAPaY
         ALepA/jvRZQ491qBCLIwVKkAIpNnn5I+8Ol7sNFNRquYo0FpFYcx/spGQX/pObKhTkaE
         Eyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756312934; x=1756917734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mVJn8wxiPOEf/yfUMBiFeypsZrm7YbFtuyWpFgOavuo=;
        b=uXMzrDfuhPS36dSMm167+HEvF9FVvUOYxD4Es3O4acsXyHU6wd956HhZR93km6h0IV
         8K9Gg+k1bODRSukP5TBD3ifwxU4jqYPKs1KAjYViF/ZiRw3/UIrGgqcrHWUkUnoCNR5U
         s3jyYfNH03aIzkubzIFhZS3rcgV2GrtHzypY6w0CMUJj4mMX2OWqgdsw4zFfzeQxJ+zn
         l6rTLO9meOJrf3T9K+9DAfF8WmvTIK0n51NNs9r4OvMHeWR0w1q0fNTlYtoSd7xCizl0
         qKWafRmJfwnb4msxQNCiReb/pqCI2//2kAWY9HVk4FpNQjBBNHak7LJdRjO5K9N5QFYA
         zc9A==
X-Forwarded-Encrypted: i=1; AJvYcCUYJi/l0SczfH4ZyibNcjwrQZusRFIiYUquKyGyJ2lDFbIN7wMhN7Y8EPUIQuzZrcMyFuQMuVMB@lists.linux.dev
X-Gm-Message-State: AOJu0YwKDwv0CJ0RaXTPMaFTtqDUBJBPCkMXtkf//GMG7WxYWEr0X+AL
	qx0hk/DCtzv0Ij0EWLE5L6Z4LnevS/pugnhJoEU3EoRHWRgeUezKeesGy66NyhTHJQ81qcCt62d
	h1PDKpRhchYHBqNXvdC0Oc255x8190Q==
X-Gm-Gg: ASbGncsqIMoqff/xle4kueuFtyaa2hozq+Cyo4rQLtKnj9636HDJ9XMXgIBvJ5qbE+0
	Tnc8m8zhQmemYQ/oQCzUTfvNsjIRjtxvdQ22NST767/GM9y6Nf8Xdj4QK0vHFIKe3t146BMcf72
	G6kKd0T5CnLa6uP2cJtJh/dPo4tVvr3YcOPkIDK3W/CW8do90H0ODo0VupfkyweoQNKgommIpOp
	2q96sQ=
X-Google-Smtp-Source: AGHT+IHukDE3pW0OOZmon4jRGfs7APdYz3q8gkmj3R3H7W/3Kx8F56gKei8lvg6G6UQcbN+Ebb1ZaQtzBe+3RsZJYww=
X-Received: by 2002:a05:6402:280c:b0:618:5392:f716 with SMTP id
 4fb4d7f45d1cf-61c1b7185fdmr17359236a12.32.1756312934176; Wed, 27 Aug 2025
 09:42:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACMJSes7ZnGo+Wyk_Db8VEUb8iXFB6-ev3hceY9aY1vjhpywTQ@mail.gmail.com>
 <CAHk-=wgOXd-meRuz5Gv2oz0W0wBUOpMO5CK9eifjfdR5Xz_-Fw@mail.gmail.com>
 <536or9s2-r219-2854-2n7s-q299s7q7noq9@xreary.bet> <CAHk-=wi2E0BBX1ZUEo5B5a0E+M_eFU_NgWgp+cABfsqR9f-cAQ@mail.gmail.com>
 <CACMJSesxLDH+ZPcbFq+s-4E+3QmhU4JejYZ6-SoYBfM0ePCCtQ@mail.gmail.com>
In-Reply-To: <CACMJSesxLDH+ZPcbFq+s-4E+3QmhU4JejYZ6-SoYBfM0ePCCtQ@mail.gmail.com>
From: Rob Herring <robherring2@gmail.com>
Date: Wed, 27 Aug 2025 11:42:02 -0500
X-Gm-Features: Ac12FXykm_dToYKbAOAdg0p6BnWUWzet3gT_TXRar7899jwVFPoFLAiE_yRFItU
Message-ID: <CAL_JsqKqO2Qg6VnRaotQdfrfoo78Y8AA1AKQBrD_XVSEK2BMgA@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] Enforcing API deprecation
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Jiri Kosina <jikos@kernel.org>, 
	ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 10:34=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@linaro.org> wrote:
>
> On Wed, 27 Aug 2025 at 00:44, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
>
> [snip]
>
> >
> > Perfect is often the enemy of good. Making the new API easier to
> > convert to, in the name of making for a smoother development model,
> > may be the right thing to do, even if maybe the new API isn't then
> > everything you would want it to be.
> >
> > I suspect Bartosz comes at this from the recent GPIO setting changes,
> > and honestly, I do think that could have been done with a coccinelle
> > script originally, instead of doing a parallel API at all.
> >
>
> No, not at all, that was super easy as the conversions were - for most
> part - trivial and while I did catch some new incoming code with the
> old callbacks, the whole conversion took 2 or 3 cycles so that wasn't
> an issue.
>
> I'm mostly referring to the conversion from global GPIO numbers to
> GPIO descriptors. This change is so profound that the two APIs don't
> even have much in common (including their implementations) so most of
> your points above don't apply: there's a fundamental difference
> between requesting a global GPIO number that's a magic value defined
> somewhere and getting it through device property accessors. We do, of
> course, have a compatibility layer for that but it's janky at best.
>
> This is the conversion that's really challenging and taking years and
> the progress is slow because you have to functionally test these
> changes. This cannot be automated or coccinelled away because it
> touches on providers, consumers and firmware nodes.
>
> And in the process: even really experienced developers (I won't point
> fingers :) ) sometimes submit patches using the legacy API which is
> something I'd like to avoid, hence this proposal.

I have a similar situation with DT APIs. It's a bit more nuanced than
the GPIO case. There's old APIs which are "don't add new users" or
"think twice before you add a new user". We may never get rid of the
APIs because a) no one wants to fix PPC and Sparc and b) there's
sometimes a need for these lower level functions. It's similar to
using devm_ APIs vs. the non devm_ variants.

Rob

