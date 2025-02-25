Return-Path: <ksummit+bounces-1888-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7397A445AC
	for <lists@lfdr.de>; Tue, 25 Feb 2025 17:16:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84E543AD2AE
	for <lists@lfdr.de>; Tue, 25 Feb 2025 16:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F115B18C92F;
	Tue, 25 Feb 2025 16:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Whve3CZp"
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A834B18B47E
	for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 16:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740499975; cv=none; b=j6//OYAFeI/4F1B5ynIGX4cYT9LNj2dJEy3UJRF18EhYYlfkBIkvz3QM/rmqHngVtIZmps5voYSV5t1tWe1/3vWwLYkS8+XUE1idt3SQfQWSG9huPhvkdlR47HPLadixzYhvNtedL0yQBhsdcm9lOZm+zJzGE8KKxYLXo2RGRlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740499975; c=relaxed/simple;
	bh=JcbH6xbF+kVoY6mPq3WSvzHL/f+wVG6jHsP4CM8z2Xw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bG49y+MHzuq0po3c99jZsBZzVKY9QARTrdIjQjaqrA3wULzNL67VFsr+m0Qv9pvgZT6YB+0zKGobz3IxZUQd6FGG2yI03kWw4mF346+1qrl9E5xaW7HdO1p/MT4NwfUqwJSR6AWyXy00qLnHJrifZaqspusPoP7KhI9l5btl5Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Whve3CZp; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38f5fc33602so3367192f8f.0
        for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 08:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740499972; x=1741104772; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+IbGw1yOaO8wpgyinqYsYfkRN9BZ1H7KtNvprS9eFQ=;
        b=Whve3CZpALEGF19te4d57l94kk/s8m/liRCWMBGCUAsTKIg+WzteF4NsqUhbJfKYFN
         r2f1pwqeOTylC60DrFNDKuUf8JZD1L5PDW5d8j6smBUV0t9JXb1k2jPtrVwVcYjQ3MHQ
         nVVb6KANa79bf+9xt0RugwCYmjv8cKFVFjwbFFfLpjvoHa63+j8X2ebDD+IUfebVOHF2
         O9qefZztlSWNgEGm4rjSyaoDxY25d3u8mpy9iE+R5Ogwq2mNKuRc/UcVVAYEjjF57+w9
         HUJp9Fvgz+urSZDybCnyqjlbFXmz12U0M/0rUs1NUW6BQz0vWCm43bjZ7WJKXJDA6m9u
         OzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740499972; x=1741104772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+IbGw1yOaO8wpgyinqYsYfkRN9BZ1H7KtNvprS9eFQ=;
        b=J7t/NDgxLqUIC1Sl6ZVHFbWO0jZ8XUqCxdjRsBmq2tX9VUu8LxsbJS/HzQXMrU3CPo
         t5+DvQNL60wyC94NN2qBDM7/RwFnKsdvNkdEx1tTJK3Dh8VLa68WpVn2TxpkOfBFRlJe
         QYMwmvxoYdbtblS8I2ndWs37V1rtFHqDFEwQRZMuOHy2kAhvpZFBQ30rwxTbj+kS6W+F
         z3KAqR6xUTmrWlqr/Brfw0Hkrwf51p2ByqGDGhI13yLwCmxKm+nApHrKfsltZGGMxq5F
         lPXJdyu5r360z6k5pMzaZGur10BDhwd0B8TMKSlAw8/YiexK0+dzxash4OsUs88lea1T
         6rQg==
X-Forwarded-Encrypted: i=1; AJvYcCWb3tnRxES0UJkEM36JP6tQaaUaeKXsJBTSRUeuEhi4GwIy19bXy4zJoNSNFStqU1/GjYED8cFN@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4lTrIreJjN2LK3a649qWwhXqAoobC0oApQi9lWsBa+MIpzJhS
	cWet5qXLlT+tKfjDCEEdln5Ud9HFimpGZUiMcickLIFhJ3rr5wwjchKbi5GwyrIJjuY2xqE4gqD
	3LBG/wdL1IwPQuqaxwO2ogdn8BBD3kfEbBTYR
X-Gm-Gg: ASbGncurt7TRNIW1HMOHgAlVPLyg2t+7uG23QL2kR0PzzxkB8TcykE+/pBbBkZF6yWv
	E2k2Iahmnju5OMKqt9dy1XAqBHv+I1gRYtqz1Oamul1HDuBNfiD3SpS60PjWIxuaJ0sbo5hKvKm
	6QioV/Dmmjel4Kd1FvqC8BoRGK/hKN/s5bsOoaHg==
X-Google-Smtp-Source: AGHT+IERrAzfsQ+2vuobOjf/H2nk2QFz1j28McsGB1U9oXx7WWKXyXxUSYxjItIeHzW3MoL6kdZmhf2JM57dNE5za7Q=
X-Received: by 2002:a05:6000:1563:b0:386:374b:e8bc with SMTP id
 ffacd0b85a97d-38f615bc9dfmr16670217f8f.15.1740499971902; Tue, 25 Feb 2025
 08:12:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo> <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com> <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
In-Reply-To: <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 25 Feb 2025 17:12:39 +0100
X-Gm-Features: AQ5f1JrjfQJh76BFqnmr7NKwuzVljSVd0iXKiJJ1_U95jYSuu4wa6KKMNxHfNZU
Message-ID: <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Ventura Jack <venturajack85@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2025 at 4:30=E2=80=AFPM Ventura Jack <venturajack85@gmail.c=
om> wrote:
>
> Just to be clear and avoid confusion, I would
> like to clarify some aspects of aliasing.
> In case that you do not already know about this,
> I suspect that you may find it very valuable.
>
> I am not an expert at Rust, so for any Rust experts
> out there, please feel free to point out any errors
> or mistakes that I make in the following.
>
> The Rustonomicon is (as I gather) the semi-official
> documentation site for unsafe Rust.
>
> Aliasing in C and Rust:
>
> C "strict aliasing":
> - Is not a keyword.
> - Based on "type compatibility".
> - Is turned off by default in the kernel by using
>     a compiler flag.
>
> C "restrict":
> - Is a keyword, applied to pointers.
> - Is opt-in to a kind of aliasing.
> - Is seldom used in practice, since many find
>     it difficult to use correctly and avoid
>     undefined behavior.
>
> Rust aliasing:
> - Is not a keyword.
> - Applies to certain pointer kinds in Rust, namely
>     Rust "references".
>     Rust pointer kinds:
>     https://doc.rust-lang.org/reference/types/pointer.html
> - Aliasing in Rust is not opt-in or opt-out,
>     it is always on.
>     https://doc.rust-lang.org/nomicon/aliasing.html
> - Rust has not defined its aliasing model.
>     https://doc.rust-lang.org/nomicon/references.html
>         "Unfortunately, Rust hasn't actually
>         defined its aliasing model.
>         While we wait for the Rust devs to specify
>         the semantics of their language, let's use
>         the next section to discuss what aliasing is
>         in general, and why it matters."
>     There is active experimental research on
>     defining the aliasing model, including tree borrows
>     and stacked borrows.
> - The aliasing model not being defined makes
>     it harder to reason about and work with
>     unsafe Rust, and therefore harder to avoid
>     undefined behavior/memory safety bugs.

I think all of this worrying about Rust not having defined its
aliasing model is way overblown. Ultimately, the status quo is that
each unsafe operation that has to do with aliasing falls into one of
three categories:

* This is definitely allowed.
* This is definitely UB.
* We don't know whether we want to allow this yet.

The full aliasing model that they want would eliminate the third
category. But for practical purposes you just stay within the first
subset and you will be happy.

Alice

