Return-Path: <ksummit+bounces-1789-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E81A3F889
	for <lists@lfdr.de>; Fri, 21 Feb 2025 16:25:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65D8419C2EF9
	for <lists@lfdr.de>; Fri, 21 Feb 2025 15:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7C421148F;
	Fri, 21 Feb 2025 15:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="jGCQpwHC"
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA0121129A
	for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 15:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740151493; cv=none; b=imyT5cBGyAJn6rgGNNGWpUif3eTmGRAVsDT0XCm9EJgVx8kZ/5NmDpzDX8iHu5/UX8MT1nx8O7Hm3ftPCAppOwD2/JL1eCmeqovKVyIpEL9CuXThZg8qaIJs7c63syOjp4AvUIN5VO8TfFkrJGbEo/mQbIF9VAaaitzI3AHvUnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740151493; c=relaxed/simple;
	bh=WK1lZZTa1x1pAgT3SVfcXVsjeamzVsyIDq5PHkT0TDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j5zf7RxtKvWyfoupcVDyBUy/EXtbNWwUMvjuqJw5VnLYvfFl/1vzLQcV3E+Tq8U40VemAn6YAdB32fpWmcLM0C0Zaaf44P1zZVMlkZ06GbimdxcUxWzcpW8Za9zHDV6JO4kgkqXpzvQngC/R8HLLMYD5UBPORkKNLbS4KnJrvuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=jGCQpwHC; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-439ac3216dcso10795495e9.1
        for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 07:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1740151490; x=1740756290; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CT2C4f9jm5PWW5vBDYC1RD3DaXN0lCMpCnB9dLdCgXg=;
        b=jGCQpwHCjizaQr9LvQtl4RGaPe7eeeHeg/ik1IxsZ55FyeHLMmYPp0pOS7d1bKb72F
         MRe/ocliLvlHDEmbZhzkqRb+EmvC46R/y3EmYWZSHITFFkAi6lxnsCqeonh9KE7XaQRU
         JKLfm/3nGqWgvTJAXvG6cJQEB5bGO20hL5jNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740151490; x=1740756290;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CT2C4f9jm5PWW5vBDYC1RD3DaXN0lCMpCnB9dLdCgXg=;
        b=u+8NyX+ZmldSTW65g7ueLpsDm5kSSkGSS/4gZWSZDcCELDGEsZXVgKJYuNJprjXf+0
         /Yo8WFoX1aPr017k51RtQX/J6JQfsQxG34chPj22Lq8Lx8JBAv9FfGvKbBrXz5qxASYj
         iY7QsKnX7Ta+ojn9f2VWwMlmtibRer75pSqkebKOPBsTO37eRmG+SzXunI4asD0FSRxi
         zfFoKngg0ujJLZR3shLV46hPXaLSf4/eWq/g7v8WeZo6jQ/qYFqPMIiqMU79jOP7Jfrr
         Ga9+LST3Z2bTd52lEMmspaO8dQHUQGs0kJbQeCKAngNUHcZorjR1M1XVrrPAhaUxcG8g
         dfyw==
X-Forwarded-Encrypted: i=1; AJvYcCX91QUpM8EXtdDJOL+6PLWpsJ/3pqZbTaAuX57qN4uJ5smXI9NG5XEPDlqR2t4M26Pr6pKX/sZy@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/4tGUHfHKypFjq2fLIu6j8Ft9r+BpHMe3UuAlBqIaj8OFjMkq
	aBdSsB1rKPZQcFU2lkhFaa69EITntx+LdyKUkEOgpFqklmQcgWewsTXcE9G6EL0=
X-Gm-Gg: ASbGnct5RlHXF8tXJ7Glv+Aq+ouVU1n2HQaCLfwHGHtAhF8Y8z/m4/tx9hVT0Nu+ab6
	YZNrsZhMgdxGOdEC5SWe1HANxUqgTjSUKY2uVE9yvH4VDXodm8vF/T36qcSMbkyguVqHRSC/vnL
	JmWqzTovvL0B/M74+Ah4YuDIBEfv0WgyoRu+o5h4B0FhFjtSJh0Gb/LM1s/wcnmXTWWTt8yxMen
	B1EJKh5zCykM4BXQwuUqxLx/fqDgA6vjGqj/J2EpjHnbIVJj1fm13WgleBn/VO2mSj0DIikyJvs
	g3+Lb7P0z0nVj7TTde7PZWKsK6q4cMeu6yFcRQ==
X-Google-Smtp-Source: AGHT+IEtmkzFkOqaG3XvlyBf1nNbqOpqNG9470mVBupdomsnEpdGJKAmORNNEt1KQvh271XfF3xsZA==
X-Received: by 2002:a05:600c:5487:b0:439:9946:af72 with SMTP id 5b1f17b1804b1-439aeae026amr27674585e9.3.1740151489706;
        Fri, 21 Feb 2025 07:24:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02ce735sm20492365e9.3.2025.02.21.07.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 07:24:49 -0800 (PST)
Date: Fri, 21 Feb 2025 16:24:47 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: Rust kernel policy
Message-ID: <Z7iav4U7k9AJDzay@phenom.ffwll.local>
Mail-Followup-To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
	ksummit@lists.linux.dev
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org>
 <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
 <Z7bO1jT2onZFZwgH@infradead.org>
 <CANiq72mM3tVmT6MQZqpzGEW4hJABVHRiODL0SnP2u+0ES4=pjw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mM3tVmT6MQZqpzGEW4hJABVHRiODL0SnP2u+0ES4=pjw@mail.gmail.com>
X-Operating-System: Linux phenom 6.12.11-amd64

Hi Miguel

Disregarding the specific discussion here, but this just felt like a good
place to thank you for your work to bring rust to linux. Your calm and
understanding approach to figure out what fits best in each case, from "go
away, don't bother me with rust" through "I like this, but I have no clue"
all the way to "uh so we have four drivers now in progress, this is
getting messy" has and continues to enormously help in making this all a
success.

Thank you!

Obviously not diminishing everyone else's work here, just that Miguel's
effort on the culture and people impact of r4l stands out to me.

Cheers, Sima

On Fri, Feb 21, 2025 at 12:44:31AM +0100, Miguel Ojeda wrote:
> On Thu, Feb 20, 2025 at 7:42 AM Christoph Hellwig <hch@infradead.org> wrote:
> >
> > The document claims no subsystem is forced to take Rust.  That's proven
> > to be wrong by Linus.  And while you might not have known that when
> > writing the document, you absolutely did when posting it to the list.
> >
> > That is a very dishonest way of communication.
> >
> > And while you might not have known that when
> > writing the document, you absolutely did when posting it to the list.
> 
> I did know -- Linus told both of us in the private thread. I am not
> sure what that has to do with anything.
> 
> As I told you in the previous reply, please read the next paragraph of
> the document:
> 
>     Now, in the Kernel Maintainers Summit 2022, we asked for flexibility
>     when the time comes that a major user of Rust in the kernel requires
>     key APIs for which the maintainer may not be able to maintain Rust
>     abstractions for it. This is the needed counterpart to the ability
>     of maintainers to decide whether they want to allow Rust or not.
> 
> The point is that maintainers decide how to handle Rust (and some have
> indeed rejected Rust), but that flexibility is needed if a maintainer
> that owns a core API does not want Rust, because otherwise it blocks
> everything, as is your case.
> 
> In summary: you were in that meeting, you own a core API, you do not
> want Rust, you are blocking everything. So flexibility is needed. Thus
> we asked you what can be done, how we can help, etc. You did not
> accept other maintainers, did not want to have the code anywhere in
> the tree, nor wanted to work on a compromise at all. You, in fact,
> said "I will do everything I can do to stop this.". So that is not
> providing flexibility, quite the opposite of it. So Linus eventually
> had to make a decision to provide that flexibility.
> 
> I am not sure how that contradicts the document -- the document is
> precisely talking about this situation.
> 
> By the way, I do not take lightly that you accuse me of dishonesty.
> 
> > Which given the binding creep means every single non-leaf subsystem
> > eventually.
> 
> If Rust keeps growing in the kernel, then obviously more and more
> non-leaf maintainers get affected.
> 
> But that just means more people is getting involved and more
> subsystems are accepting Rust for their use cases. So that would just
> mean it was, indeed, a good idea in the end.
> 
> > I'm not sure how that matters.  Of course your Rust testimonials are
> > going to like it, otherwise you would not have quoted it.  They
> 
> Not at all. As I say in the talk, I included every single quote I got,
> even up to the night before the keynote.
> 
> It is nevertheless very biased, because I asked people we interacted
> with, which were mostly positive or neutral. I acknowledged this bias
> in the talk too.
> 
> However, just so that others are aware, I did email others that are
> negative about it too, such as you. And you did not reply.
> 
> > Well, obviously you do.  But as in many other things I would usually
> > not count corporate pressure as a good thing.
> 
> Corporate pressure is not good. Corporate support is.
> 
> And we need that support to accomplish something like this.
> 
> Cheers,
> Miguel

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

