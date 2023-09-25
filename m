Return-Path: <ksummit+bounces-1189-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1237ADD6A
	for <lists@lfdr.de>; Mon, 25 Sep 2023 18:50:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 6D4D4281CA0
	for <lists@lfdr.de>; Mon, 25 Sep 2023 16:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9311D68C;
	Mon, 25 Sep 2023 16:50:42 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D460914A83
	for <ksummit@lists.linux.dev>; Mon, 25 Sep 2023 16:50:39 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50309daf971so11102018e87.3
        for <ksummit@lists.linux.dev>; Mon, 25 Sep 2023 09:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1695660637; x=1696265437; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FkfAX/RWqq7mVXYD/yvB+HIjbofX4XxbkSlj+NRMAVM=;
        b=aNFo00cErw5fWdAUJo/pzg37ZDRqHgUYhMopuwEyA4qUdZuEYjPqwy8RRuhYot4OVC
         l5FGrpAH6JYMrtdUAbemw4sIGhJ1uVt0ZkGT6dTnM5o6ZOJgtF4xCTMftHaIOLzCLbEM
         fephQQZh5T7tBIxpWpJ8l/V+7yclVDQfsdTqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695660637; x=1696265437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FkfAX/RWqq7mVXYD/yvB+HIjbofX4XxbkSlj+NRMAVM=;
        b=Q/+eCiZCBZDWVZ/K+BSCgWTEeQUMqtwEenntls/C879Xg1sbjUblm/AEOIA1RvY4rr
         QgTMi5/T9G5ibhwSaO2jCrsqhSiOIXiZDOY6jzlVmrHgm43SftF2EkQKrVhsEkSqPpSH
         c7QYzSN6VL5s4I4653UCDcz9Szul5cc0l2wZt9fidCTHOta7AkvzVwBWdPpumT4dk+b8
         VpHXpZZMW/R1Q4Lo3JT5Pq5TQhWIJNewFJb0a88UHN6ZnNufdz03QgmKqGxXdb+XlKyY
         l0rU3EIS0EaFra4Y4ZrcG33O8YIGR9XDuhwgmXluXjPuWC+VPVtNK9faC8N3g+vR9KMb
         4TzQ==
X-Gm-Message-State: AOJu0YzQdCflYJDTqrkDHCph8cC5GVBDABUSXTItueaQPI7Cttb+RqKL
	De71p18jnOpnaLYds6ircWh341mG5ydGQ6hY361P3i2q
X-Google-Smtp-Source: AGHT+IG5jAzzdcA9ythQT/Ml6j+YJaLTh8TuE1Kgi3cvuhmFXpdWx+Z3zsxIBsRHrXy+LWyHCcl81A==
X-Received: by 2002:ac2:4c4d:0:b0:503:18c5:6833 with SMTP id o13-20020ac24c4d000000b0050318c56833mr3272140lfk.61.1695660637489;
        Mon, 25 Sep 2023 09:50:37 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id ep30-20020a056512485e00b00500cede2786sm1893115lfb.65.2023.09.25.09.50.36
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 09:50:36 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2c00e1d4c08so113558211fa.3
        for <ksummit@lists.linux.dev>; Mon, 25 Sep 2023 09:50:36 -0700 (PDT)
X-Received: by 2002:a05:6512:238f:b0:503:1992:4d63 with SMTP id
 c15-20020a056512238f00b0050319924d63mr7791737lfv.19.1695660636109; Mon, 25
 Sep 2023 09:50:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZO9NK0FchtYjOuIH@infradead.org> <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
 <ZPkDLp0jyteubQhh@dread.disaster.area> <20230906215327.18a45c89@gandalf.local.home>
 <ZPkz86RRLaYOkmx+@dread.disaster.area> <20230906225139.6ffe953c@gandalf.local.home>
 <ZPlFwHQhJS+Td6Cz@dread.disaster.area> <20230907071801.1d37a3c5@gandalf.local.home>
 <b7ca4a4e-a815-a1e8-3579-57ac783a66bf@sandeen.net> <CAHk-=wg=xY6id92yS3=B59UfKmTmOgq+NNv+cqCMZ1Yr=FwR9A@mail.gmail.com>
 <ZRFVH3iJX8scrFvn@infradead.org>
In-Reply-To: <ZRFVH3iJX8scrFvn@infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 25 Sep 2023 09:50:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgD6561fJPoNQXmT1nBcoJ=WQk=batM0BcNFdEJKFa8gA@mail.gmail.com>
Message-ID: <CAHk-=wgD6561fJPoNQXmT1nBcoJ=WQk=batM0BcNFdEJKFa8gA@mail.gmail.com>
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
To: Christoph Hellwig <hch@infradead.org>
Cc: Eric Sandeen <sandeen@sandeen.net>, Steven Rostedt <rostedt@goodmis.org>, 
	Dave Chinner <david@fromorbit.com>, Guenter Roeck <linux@roeck-us.net>, ksummit@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Sept 2023 at 02:38, Christoph Hellwig <hch@infradead.org> wrote:
>
> On Wed, Sep 13, 2023 at 10:03:55AM -0700, Linus Torvalds wrote:
> >
> > Yes, don't enable them, and if you enable them, don't auto-mount them
> > on hot-pkug devices. Simple. People in this thread have already
> > pointed to the user-space support for it happening.
>
> Which honetly doesn't work, as the status will change per kernel
> version.  If we are serius about it we need proper in-kernel flagging.

That would be good, I agree.

The obvious place to do it would be in /proc/filesystems, which is
very under-utilized right now. But I assume we have tools that parse
it and adding fields to it would break.

The alternative might be to add "hints" to the mount options, and just
have the kernel then react to them.

IOW, the same way we have "mount read-only" - which is not just a
semantic flag - the kernel also obviously *requires* read-only mediums
to be mounted that way, we could have some kind of "mount a
non-trusted medium", and the kernel could say "this filesystem can not
do that" on a per-filesystem basis.

                 Linus

