Return-Path: <ksummit+bounces-1695-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1F2A3BCDD
	for <lists@lfdr.de>; Wed, 19 Feb 2025 12:32:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9898B189A6D6
	for <lists@lfdr.de>; Wed, 19 Feb 2025 11:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC6B1DE4F1;
	Wed, 19 Feb 2025 11:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AGY6Z4KO"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F4B1D88D7;
	Wed, 19 Feb 2025 11:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739964762; cv=none; b=YkfQaSINTLHjHC9T3a8QS5qdE4gFvqZd1mgqcMssLkXgM5/JvASo6nkVFFNv7wOCSd2fv793ZprUz2VswiZ3MugDLL/D/zPR5wM/e0hJSEA0RDDHcvckLrJ1lCyGOTB0CwZ8JG6AHdo4Y6xZ11KC3ViZFN+XInsX2yO9Y9E6p2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739964762; c=relaxed/simple;
	bh=I2IYFnG3GIib9isLSlFH/EVcS4yZe/9sWENotjB4I4k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nOWzWfRD1yhen3yPJnEml2K9U7T9lXxmoFuf7CAeMP6Tni71fuyyHvXJnEDe7qLgixareO5JVSjoalD4TMiO40FsbZuRuKvY1prPk5Gc/6BtWHl+WlVRSRHQnZfOgjHnxt2M+17YutnGh6P9uG5CnjM30Y5ZQFZud3+GS0xb7Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AGY6Z4KO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7DA9C4CED1;
	Wed, 19 Feb 2025 11:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739964762;
	bh=I2IYFnG3GIib9isLSlFH/EVcS4yZe/9sWENotjB4I4k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=AGY6Z4KOU2xd3Dpb44VdYsIfktm4NVzwQ+PPVVHHqT+KE6dU71R5QSdSSKEDz1b07
	 wjEv1T/Ds6fI/hxqfUNN/Ty+Lp4Q4lFrc4Efyaz5RIyb/C4bHQ2MC97W+g2WOJDOuX
	 0lXJUi257QTEYMJBOvIj5EYlOo2OWgDldsP4vyIJbY77plsv+aTE3LZtPSRLsQpZNI
	 9j2T9S1Ml0FLktHomjjoiRgd4dfemKWVeHHkxYLHha8OgMLWrChtzqIvy8zuXAZ64Q
	 /0CG6DDAplKn6nC/v0lEym4t26bgNpzlzJvWuF5iGzcLX6gWPoIwue/6vDL0CX6vA/
	 XbJOHPfbfs8kA==
Message-ID: <0f578658c26406326bcca3e3d3f1cf45fc969c17.camel@kernel.org>
Subject: Re: Rust kernel policy
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, Miguel Ojeda	
 <miguel.ojeda.sandonis@gmail.com>, rust-for-linux	
 <rust-for-linux@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>,  Greg KH <gregkh@linuxfoundation.org>,
 David Airlie <airlied@gmail.com>, 	linux-kernel@vger.kernel.org,
 ksummit@lists.linux.dev
Date: Wed, 19 Feb 2025 13:32:37 +0200
In-Reply-To: <Z7WCrA_bbWR6PQQG@Mac.home>
References: <Z7SwcnUzjZYfuJ4-@infradead.org>
	 <36783d51be7576fcdbf8facc3c94193d78240816.camel@kernel.org>
	 <4cbd3baf81ca3ff5e8c967b16fc13673d84139e8.camel@kernel.org>
	 <e63089e15c6f4d19e77d2920d576e0134d8b7aa7.camel@kernel.org>
	 <Z7T5_WGX_VXBby9k@boqun-archlinux>
	 <615ce44fa528ad7be28ba518e14a970f04481078.camel@kernel.org>
	 <Z7WCrA_bbWR6PQQG@Mac.home>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2025-02-18 at 23:05 -0800, Boqun Feng wrote:=20
> In my opinion, about testing, code style check, commit log, etc. Rust
> patches should be the same as C patches, at least during my reviews,
> I
> treat both the same. Therefore I wasn't clear about why you want
> additional information about Rust patch only, or what you exactly
> proposed to add into kernel documentation for Rust patch.
>=20
> The policy documentation in this email clarifies some higher level
> stuffs than patch submission and development, such as "How is Rust
> introduced in a subsystem", this is for developers' information maybe
> even before development work. And I agree with Miguel, if we want
> this
> information in-tree, we can certainly do that.
>=20
> Hope this can answer your question?

Hey, it definitely does for the moment, thank you.

I'm just poking ice with a stick, and not even touching ground yet,
given that I was only able to test compilation ;-)

BR, Jarkko

