Return-Path: <ksummit+bounces-2232-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E12B385C3
	for <lists@lfdr.de>; Wed, 27 Aug 2025 17:07:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A73FE175C61
	for <lists@lfdr.de>; Wed, 27 Aug 2025 15:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A286B26F2BE;
	Wed, 27 Aug 2025 15:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DZrvq1+p"
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56400216E24
	for <ksummit@lists.linux.dev>; Wed, 27 Aug 2025 15:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756307261; cv=none; b=Gm3XpYSPfyNZFveRxa/XyxW3BZP5je8W8C5SWCZIX8njNRPZGQhut+amNxXEQA8na+8GkAN4dW6gluoX2is4s4EfIrLU+U+naJNzje/VqsD5Cr50PtJ0nWWQIGb/UCM5w88wXoV3Ox85p5E1i5vr2hOdarB/006uYnA+UMh1WC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756307261; c=relaxed/simple;
	bh=dOuZE4A++QXIxhKd+WrZnFsU4UmxHWpRzgvf6q8StHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b9jMykHasQ/KL49AoBT7Usw71zTyN3ycgXC5S5UMIDad90spGeKFbM51Zj0Zon246M1pgv0qFkiNND2k/dUk4JiW5/smIgQx5JgM5BRhdoZitobWJ6PA/Qs8H38Lt6pjcPKDWsgImKEw3M3+QpF2qrQzQJctUAYopaeMs3zEztQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DZrvq1+p; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb7a3a085so1103396666b.2
        for <ksummit@lists.linux.dev>; Wed, 27 Aug 2025 08:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756307257; x=1756912057; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dOuZE4A++QXIxhKd+WrZnFsU4UmxHWpRzgvf6q8StHQ=;
        b=DZrvq1+pHP/MdI6sRABfWDzV0SFk0hMXNExXHuqXzfB1jxJxJmTTBoUOWg5zf/xpUU
         aCQhm/hXCMHx4bvpdgP8SXYPsJY+Lfsg8UzGdnSubnObCz/hQhPbwqqr/XKBl49r316R
         +D+2LxvYObWRFsTI/fMLY5Zfv6vfhL8PzlYEPBFzE0MPdHP55WSJRa9qrFT+3wbOjHcD
         pzSYpG+OtHG7siWLN4wvyBklxoHcJ9R1NUAHeGQS12Bum7JoXOLfZhsog/U9iWCPy9hS
         J8yLbOCrgZ/5apws0wEWA3Z6e4LyMJfTS2JtNUtGiHDyqHxxhBUpOjYWhd8r4RWuqHYH
         6OVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756307257; x=1756912057;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dOuZE4A++QXIxhKd+WrZnFsU4UmxHWpRzgvf6q8StHQ=;
        b=it7736fBV1AxwI2H5yAbEEoG0jrywmIbADRRXq4lDECVRmZ4wFo9v7C6qhj4gQ/W2P
         vUGnGadjhyJib0Gts7EP/imTnpw5urA6dcgvOxcF4To2thpiBCLDj8EGAnNlloEhGu1g
         EQK3QdU4cnDVqvnraeOUwA+LalWgJyThUY0YZZFAX4UJ+BYqhQq8fcq+PJpbGRlMNPv2
         L8shm+w7nmurqSwOEH5ZtwMvrwcAYqC2NgQM+J6qkT7NlU0M1rNsizmXEeX5AAcfyp/q
         nh34Jv608rpy/BKCYShhUUsdzG1roKWWgGIeb/+umBozQF+YBWFS4z2rwX3QXqMTFT+X
         fODQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKzz3TdZfaOWZCxIkhweiUmUxBgLbPFFDxHiRn8XHOEPFIkJLqGep4MiPI36bqK2wZ1hCkOVC1@lists.linux.dev
X-Gm-Message-State: AOJu0YwdGiH7sru938wWNsXTVxHHMK0GdNqitSfBA1+hGl64zWkqBsxy
	7nFafeJhl7CNcSZJVWuCVR/cP7d8dnmtOuW/3K2Xnr5RVtGW3lhHwpWLwp4bbrayY3pRWH5O5R2
	5xaPQ/JWKsduHlCfjGdrhGUbsgbj4JCy/aIkkxot/yRfRQ+J0e423
X-Gm-Gg: ASbGncvXUpBBRN4C1wdOc39rmfrNi0C3K2CXHy3eQQtC9wZTRSqkgnOltSZqYuAbimY
	SLZHGeYq1t9PgFwtvXyJ8iR6lyNw2JvAfAa5PWCmFvtHNdGLOacbNMvyE+aIDofYAb91NoAziHt
	gkkxPiucafOT+Yn+V7jS0lvLBe3KjIvPIOK9Lgu2qaUJxso+cInkwE8ranKge3O7v8AjrhoxflG
	cmTdvhpvrSbaG12gWX5InLXt2dnxDonZSsYxZU=
X-Google-Smtp-Source: AGHT+IG/y0BwC4ffz54WX+aDtkh0DGdAgXdjPLTDSs7PPwdvnUcYztl5HYGsBcHeGbA9epferwwvJM5XVLKrfXzhHkI=
X-Received: by 2002:a17:907:1c13:b0:afe:d62a:f04e with SMTP id
 a640c23a62f3a-afed62af753mr7624066b.29.1756307257514; Wed, 27 Aug 2025
 08:07:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACMJSes7ZnGo+Wyk_Db8VEUb8iXFB6-ev3hceY9aY1vjhpywTQ@mail.gmail.com>
 <CAHk-=wgOXd-meRuz5Gv2oz0W0wBUOpMO5CK9eifjfdR5Xz_-Fw@mail.gmail.com>
 <536or9s2-r219-2854-2n7s-q299s7q7noq9@xreary.bet> <CAHk-=wi2E0BBX1ZUEo5B5a0E+M_eFU_NgWgp+cABfsqR9f-cAQ@mail.gmail.com>
In-Reply-To: <CAHk-=wi2E0BBX1ZUEo5B5a0E+M_eFU_NgWgp+cABfsqR9f-cAQ@mail.gmail.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 27 Aug 2025 17:07:25 +0200
X-Gm-Features: Ac12FXxrMDeaQ8EgWhyl2D_H8WSHsD8TcHX0xG0Nbs73a2GZYjEwmf2zLiC3204
Message-ID: <CACMJSesxLDH+ZPcbFq+s-4E+3QmhU4JejYZ6-SoYBfM0ePCCtQ@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] Enforcing API deprecation
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jiri Kosina <jikos@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Aug 2025 at 00:44, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>

[snip]

>
> Perfect is often the enemy of good. Making the new API easier to
> convert to, in the name of making for a smoother development model,
> may be the right thing to do, even if maybe the new API isn't then
> everything you would want it to be.
>
> I suspect Bartosz comes at this from the recent GPIO setting changes,
> and honestly, I do think that could have been done with a coccinelle
> script originally, instead of doing a parallel API at all.
>

No, not at all, that was super easy as the conversions were - for most
part - trivial and while I did catch some new incoming code with the
old callbacks, the whole conversion took 2 or 3 cycles so that wasn't
an issue.

I'm mostly referring to the conversion from global GPIO numbers to
GPIO descriptors. This change is so profound that the two APIs don't
even have much in common (including their implementations) so most of
your points above don't apply: there's a fundamental difference
between requesting a global GPIO number that's a magic value defined
somewhere and getting it through device property accessors. We do, of
course, have a compatibility layer for that but it's janky at best.

This is the conversion that's really challenging and taking years and
the progress is slow because you have to functionally test these
changes. This cannot be automated or coccinelled away because it
touches on providers, consumers and firmware nodes.

And in the process: even really experienced developers (I won't point
fingers :) ) sometimes submit patches using the legacy API which is
something I'd like to avoid, hence this proposal.

Bartosz

