Return-Path: <ksummit+bounces-2534-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE98BE0574
	for <lists@lfdr.de>; Wed, 15 Oct 2025 21:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 106B45429E0
	for <lists@lfdr.de>; Wed, 15 Oct 2025 19:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5010F2D3ECA;
	Wed, 15 Oct 2025 19:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UJI+2GD5"
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340A7304BD8
	for <ksummit@lists.linux.dev>; Wed, 15 Oct 2025 19:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760555731; cv=none; b=ZNzQwh6XIdD9YABBUSsyKqYrt65jT2TTmHA/qobsoW8fMWswyCytzO9s7vbDVGwzoCE6wxB8qFeOTayinuEH9Mf8bjaoZAYi/l2DI+cCEmIVS8tmZKNPKFdOhcoB49IINOhM87x+lUGoxp+0/WJbnuPH12Emn07ZOIgKmUfqsJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760555731; c=relaxed/simple;
	bh=4gul8AzUt8xxZeIe1FNFyGNxsxamsKaK/kGeECYuDrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CxxUSMb6NJBIYC9OAApRXjZ/znKxYH/wnXs/z2fa0cwGxBnMJ002hwZxn/7W/5QZX3MoqxbdDhB6BhY24B+FsilUAY5Ncp21Ed5U5pMZK0C6fngPvjjDpzGkIquVFI2QFNKpaqWsIgxAAB+SvZ5CO0MBOfn2zbz9T7hu814DPEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UJI+2GD5; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6364eb29e74so12242576a12.0
        for <ksummit@lists.linux.dev>; Wed, 15 Oct 2025 12:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1760555727; x=1761160527; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QNBGNbFCPur+e8jqI2CsfR7rMil7dlMQmUcKeORfPHU=;
        b=UJI+2GD5u+SSfTzvfEHHP3UAvIX+bljsSrsDZhIXTcOVOxnnRnankFpX89x3X3npGZ
         NwfTO2+aL2BrwCMcbefmff38kFGaL1saYky9AyFeFBQR3hCg/OAk0xPWlAoTufx+ZJw9
         EJz2U/kSUhaUVMKRvK547c2Dr4JpOoY4Ub6KA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760555727; x=1761160527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNBGNbFCPur+e8jqI2CsfR7rMil7dlMQmUcKeORfPHU=;
        b=dS2BR49WmZheCardt0+tZI1XTP0cYYbV/AO8hBZsW+iZ14TuQKEBtmd5EWkwyEgg2a
         Il5dgW7DK+UdXV+zm4mxs0KMU5buZcuPi8Viaj1Mh6o1Ze/qKQfPv3viC6WWSe4L7vB6
         +P3rze1qclShRAL3PbjHckW9ZdX3M8lV+JAH2XmzCEyxmoG6vdH7Al062pRIAab2cBg9
         o3j6X1925WwTr8Wgrjtw/oHYIuJZHto6+dZHeQSDIEgnAx9RVoIbFV/POg4pG+2SAgzi
         61nwX0SbdlbBSBEujoFfmx5mwm6xmii3lQHA9sQ6KIbes9jcV07UkeRIyXZIc9Y8PySk
         MqAA==
X-Forwarded-Encrypted: i=1; AJvYcCUGuOsOj+vH0tOAjXZ6WdQDNcXS6Ece7narYMC/QS1Ok7IR7+CBUArZnK3b0M7tVL2QogmN/oG8@lists.linux.dev
X-Gm-Message-State: AOJu0Yzp+jeX7EaGhwYStgFRtKxRYcwTfNwcNXv7aBRbY9Q3IVGcOzsp
	pVMocb/O4AmOAgn5ka2NAF+QDubntE0wY6nXRWUOgOJ6sfJNBUbfX5lVQsllkEpghCaBlVDVBLM
	UW38ae3c=
X-Gm-Gg: ASbGncsZKzyIDqeQ2ZWG8n7SAoqRnbU1YOhdVxczo+lW8dyW8SGg/azyNSx1fRgBUtG
	j4nyoBECgXBlfHtvHPvTdoQBC/r31Pt/C7wlthLUhmCSMI5hP2gQIGv1NntnAwaoWREStK3ARDQ
	XIRrtjSgfnSSyNRQ4phhA68AwzscC/j9T4u/VwSUSK0w5dDAy+Wbt8wvCHJ5zIrAhTiEEbvPtH8
	95kzdW/1G+BQfB9CuqStaqfRX0qbCY5fYkyft6yc2Iij2IyLIdahP9dCq1mjcFx70izzHAKSD7o
	YADM0PXIiGrmqO0EzkyKARhzFO6VBRlRDgk1Bot2GFR2huCJ7/893vU3qBZk/334oUuoMf1HHPu
	HgpmmHUNMug7s7DHl56hrDl2t471J5kweedQKxni+xtfNJIcB6Gj7bE8ZmP1IuWMxu9w32NNR6A
	WCb9eiWm278q5Qkpo=
X-Google-Smtp-Source: AGHT+IEv9sbHe6lMheNWQ0oyGw0fNTR4nZH4jHCnQX5O+Pv8h5OcPL58Y9hfJbxSUr7eaCJIN7eQxw==
X-Received: by 2002:a17:907:7ea6:b0:b3f:a16d:da7b with SMTP id a640c23a62f3a-b50aa393bf8mr3017832666b.8.1760555727148;
        Wed, 15 Oct 2025 12:15:27 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd5b98fdsm294961966b.73.2025.10.15.12.15.26
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 12:15:26 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b2e0513433bso572981966b.1
        for <ksummit@lists.linux.dev>; Wed, 15 Oct 2025 12:15:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYrEcJVVcHNQHzTQx0/qsbv4vACL6NBttjT0q+bHALf1AoaoELjahrZXYdyYD3sGgXhrwZydPW@lists.linux.dev
X-Received: by 2002:a17:907:3f8a:b0:b3e:5f40:9894 with SMTP id
 a640c23a62f3a-b50acb0e681mr3542824966b.62.1760555725671; Wed, 15 Oct 2025
 12:15:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
 <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch> <2025101448-overtake-mortality-99c8@gregkh>
 <68efd54da845e_2f89910071@dwillia2-mobl4.notmuch> <20251015-versed-active-silkworm-bb87bd@lemur>
In-Reply-To: <20251015-versed-active-silkworm-bb87bd@lemur>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 15 Oct 2025 12:15:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiLMH5QBF+veebJgdh=e=Q5uz7AEF0sfWPRhSAXvg8ASg@mail.gmail.com>
X-Gm-Features: AS18NWAHSH7OhiWjKMVs4bU_iWDnhzfGqRWqe5dDqONa2JVdTJWO_FCEZbloz0E
Message-ID: <CAHk-=wiLMH5QBF+veebJgdh=e=Q5uz7AEF0sfWPRhSAXvg8ASg@mail.gmail.com>
Subject: Re: Replacing Link trailers
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: dan.j.williams@intel.com, Greg KH <gregkh@linuxfoundation.org>, 
	Doug Anderson <dianders@chromium.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Oct 2025 at 11:37, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>>
> Git notes are fragile, they have important scalability problems (

Yeah, I don't think git notes are the answer - they are good for
purely *local* notes, but they just don't distribute well.

I think people would be a *lot* better off with b4 integration in
their workflow.

For example, I don't know how many people use git hooks. I personally
only do a couple: mainly I use them to do signature verification so
that I don't miss the "oh, somebody sent me pull request without a
signed tag".

I didn't always notice the lack of successful tag verification.

So I have a commit hook that makes it very obvious when I don't have a
key or when the tag was an unsigned one.

How about the people who love their link tags look at making them
*conscious*. That's what I hate about the current situation: I really
see a lot of completely useless tags because they've been added
mindlessly, and they are nothing but an annoyance.

And if people who have real workflows that use Link tags actually were
to add them consciously, I wouldn't hate them so much.

So for example, people have mentioned amending patches (although most
people have actually mentioned amending the commit *message*, which
doesn't change the patch ID), and that's where inserting - as comments
- the lore links for the original commit could be a good idea.

Look, you can have a .git/hooks/prepare-commit-msg script that looks
something like this:

  #!/bin/sh
  COMMIT_MSG_FILE=$1
  COMMIT_SOURCE=$2
  SHA1=$3
  b4 dig -c "$SHA1" 2>&1 | sed 's/^/# /' >> "$COMMIT_MSG_FILE"

And lo and behold: you'll find the 'b4 dig' output at the end of your
commit message as you start editing it.

(The above script is "tested" in that I verified that yes

Ok, so the above is a really minimal hook, but I hope it gives people
ideas of how they can make things like Link tags work in a *conscious*
model, not a "mindlessly add them" model.

It's really the "add a flag to a config file and forget it, and now
every commit you do has a link tag whether you thought about it or
not" that I dislike so much.

             Linus

