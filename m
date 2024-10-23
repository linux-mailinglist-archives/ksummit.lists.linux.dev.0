Return-Path: <ksummit+bounces-1628-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 290409AD39A
	for <lists@lfdr.de>; Wed, 23 Oct 2024 20:07:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C14FF1F22C6A
	for <lists@lfdr.de>; Wed, 23 Oct 2024 18:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4D81D0F73;
	Wed, 23 Oct 2024 18:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LorOrS9m"
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBCF1ABEB7
	for <ksummit@lists.linux.dev>; Wed, 23 Oct 2024 18:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729706841; cv=none; b=VDLnKH7fam6aqVvwuFMKDf78IhA5MyJb1PCPqPRWphPFB36jbaljeukiKoa2JGz4eECgMaQrs+W2OQpsRim4bwuqCmC1EFqhhi7q30FqZqUPNTWNLvvMOaxL3gw9YONeE1Gh0hZ/1zqFC0u88r2Y09/p+wahaBKsqaeBkhHSX3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729706841; c=relaxed/simple;
	bh=yj+9Mu5hdOk0PtgoeqGGPhrFchv8MxFwKehOOUmXTao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KzGgHFk5zU5iRrvwCjo1ZbBIOjuCvm5f3B6RrYlt0i9z1SUQwNE0BRhTy46rmKPXUaXqjd0au47nqHgrKRQ3xQT2DrkG5ym0KjDEnbs5mqTgWNS53WexTsLZckIL4d+qqMFZNymWbdGY1Uy4ZE/kfK6KFSIdiIBBs+F945IfYZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LorOrS9m; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a99e3b3a411so211162566b.0
        for <ksummit@lists.linux.dev>; Wed, 23 Oct 2024 11:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729706838; x=1730311638; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tN6K2TMFy+8W8ZGYWdpnPeKr5nzAwF7VuobwTRTKhDs=;
        b=LorOrS9mgdDhHVshtN5rvUFUZcdB9S1+feXEEsMc6hOQvYM5a9/JJqJv99q6D3pPU2
         SDH++/pq/rFbEAcafivOIQa5BvDJELKq7nrDTQsAKvdYrYSYctFUprmAM8s0iTKy0Fx8
         fuPQP+xKmAc5Z2ICZjGSJA+BgzwPcpibFHzMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729706838; x=1730311638;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tN6K2TMFy+8W8ZGYWdpnPeKr5nzAwF7VuobwTRTKhDs=;
        b=hQhh+1meqw/4poHb6zPSpjjBrRK2ciOfK9u5r5mZ8bEN4O+8W1GI02J+eEBA3WxBt8
         W3WurhmjU5RrY77KRS89XuWPYJr/1IRvEFbDCElXtiGIL71K+NVX0VM+wL7lzLcmOOqd
         Zxnn/aRm4dSz5ZsuwrhK1ArAuzytv7r7RGA/OIStOC7GpmxikKt/oqOLZ9e+y9p9hhh4
         fsdQU6o6FwJ2N3uPMB5ZRutgWfCF6/oNygHETfmPXn87Q5x+3TR0L7cpo149qjGI5pKe
         0jUqEH21FHU1UM5NtZMu6chsPRBKfHCvUHiVneYjUkWhRt/fbh4d8uU08hq2ht/I4DD2
         tT0g==
X-Forwarded-Encrypted: i=1; AJvYcCU+tl2P0/9IT2gKdk5OrcD8ZG0jXDuNTXF/qbEwrnnMH/IzFchC0cjAetSA+zJIOZGyP0i5cRTi@lists.linux.dev
X-Gm-Message-State: AOJu0YzQSk9skyvhg3smBlQhpZFHhOBHg1G9p40PX5J7fDlnx5/++4/q
	ReCT/dTsIduE2FnKbamJkQSpPyrW8LfzbKKo6o9uBUCyNI5iIP6kkjI+CRd0FfewDgfYCUUhZ7j
	Y828I3A==
X-Google-Smtp-Source: AGHT+IFWq9GKStNV6g2r+6FHhd63lpYWqYNI8jNDUmvZlMgEVUknaPvxlEtn5c9bepHS3iswmEs0zg==
X-Received: by 2002:a17:907:9608:b0:a9a:babb:b916 with SMTP id a640c23a62f3a-a9abeff13c4mr310732466b.15.1729706837977;
        Wed, 23 Oct 2024 11:07:17 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91572c02sm513950366b.178.2024.10.23.11.07.17
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 11:07:17 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a99f629a7aaso14425466b.1
        for <ksummit@lists.linux.dev>; Wed, 23 Oct 2024 11:07:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW25vHuqD+3jNM/Jbce86+gTiztA7Dl2gDvGIotfXAwxstg8GIugdorwS0D0Z4WMjhJZINh8LyN@lists.linux.dev
X-Received: by 2002:a17:907:6ea9:b0:a99:ff33:9ba5 with SMTP id
 a640c23a62f3a-a9aaa6218f7mr835695866b.24.1729706836809; Wed, 23 Oct 2024
 11:07:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZxZ8MStt4e8JXeJb@sashalap> <792F4759-EA33-48B8-9AD0-FA14FA69E86E@kernel.org>
 <ZxdKwtTd7LvpieLK@infradead.org> <ZxdyYjzxSktk34Zz@sashalap>
 <ZxiOjBRdO6EMAY4H@infradead.org> <10b0cb74-2068-4819-ac91-fcf98ca8d96c@paulmck-laptop>
In-Reply-To: <10b0cb74-2068-4819-ac91-fcf98ca8d96c@paulmck-laptop>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Oct 2024 11:06:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj4aSJsVA6weV7u9KD1yA74JZq3dYZKbUtxp=3o_esnVA@mail.gmail.com>
Message-ID: <CAHk-=wj4aSJsVA6weV7u9KD1yA74JZq3dYZKbUtxp=3o_esnVA@mail.gmail.com>
Subject: Re: linus-next: improving functional testing for to-be-merged pull requests
To: paulmck@kernel.org
Cc: Christoph Hellwig <hch@infradead.org>, Sasha Levin <sashal@kernel.org>, Kees Cook <kees@kernel.org>, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Oct 2024 at 10:47, Paul E. McKenney <paulmck@kernel.org> wrote:
>
> > Yes, without Linus caring we're not going to get our process worked out.
> > Not sure how a tree that probably won't have much better latency than
> > linux-next is going to fix that, though.
>
> If I recall correctly, one thing Linus asked us to do earlier this year
> (ARM Summit) is to CC him on -next failures.

Yes. I definitely care about failures in linux-next, but I often don't
_know_ about them unless I'm told.

The linux-next automation sends notifications to the owners of the
trees, but not to me.

And that is as it should be - I don't want to be spammed by everything
that is found in linux-next.

So failures should normally be fixed by the owners of the trees when
they get detected, and those trees should not even make it as pull
requests until the problem has been resolved.

After all, that's kind of the point of linux-next - finding problems
*before* they become pull requests.

But that does mean that if some failure has been detected in
linux-next, and the maintainer has *not* corrected it, I don't even
know about it. And most maintainers are very good about this, and
point to things like the resolution reports (which are not actual
problems, just heads-up).

So automation that says "this tree does not actually work" would very
much be appreciated. I'd prefer them to be the same kind of "before
the pull request has even been sent" situation, of course, but if
problems _remain_ in linux-next, and pr-bot sees the pull request, I'd
actually like automation that says "Oh, this tree has these issues:
..."

IOW, I very much do care. linux-next has improved our build test
coverage and is a big deal. The more "problem coverage" it has, even
outside of just build issues, the better.

And yes, I know some people do functional testing on linux-next
already. The message at the maintainer summit was a bit mixed with
some people saying linux-next tends to work even for that, others
saying it's often too broken to be useful.

              Linus

