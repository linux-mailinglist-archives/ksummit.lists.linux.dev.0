Return-Path: <ksummit+bounces-2558-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A49BBE3958
	for <lists@lfdr.de>; Thu, 16 Oct 2025 15:04:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CD50405C7D
	for <lists@lfdr.de>; Thu, 16 Oct 2025 13:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 574EE32D430;
	Thu, 16 Oct 2025 13:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="noqoyAKt"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B402FE056
	for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 13:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760619653; cv=none; b=FEw6JYVkrKRcSr1TQDkX8Wra6s+WUeRBpXALwZF0BioFNCTw5idC/CroZa6jACSBNv6g+Q+gduzHs3J9o66k52a48InGjbUgkDcCjg6PjXEMdYwg6qEKIORC4T7bajgH5PR16nQ76611aQgH/QFiJNajD4A/i2NBn/VJaYZIfuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760619653; c=relaxed/simple;
	bh=OTdXMlC/sQWI1o4tpnpMe7xwtxS4wdQFYkO5gibhLjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=crne4ar1oUwTIjmSfC9JyWHi/bxBum2fMJnDJDzk7eIeFY4rxcdvG9o2SZ5LeclPzSO0+wFKGbGai3tOASgu+il6PK2DYzjPy1m4KpaK5p+Ek7RGh4adehVFP6qVM/uJ6kkC85wFqAsaJihqFUmif6sVvvhUgkn7Mt+ce9KVkXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=noqoyAKt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50EC4C4CEF1;
	Thu, 16 Oct 2025 13:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760619653;
	bh=OTdXMlC/sQWI1o4tpnpMe7xwtxS4wdQFYkO5gibhLjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=noqoyAKtJdPJwlsChJKjtrnskajw2H03EAoe8+CHk8xqutqVpA+D7vIM3s+eEu+ub
	 R1StuVdwZXil3BK/MRHLTaWUffM0j67DKezbItM++U1pzkJ6GHNJ4iWaDMOFYhMcwV
	 O/OgQpDmD4TjX6EsLbtmh1WGPvDRRgonP9uicRwk=
Date: Thu, 16 Oct 2025 09:00:49 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, dan.j.williams@intel.com, Doug Anderson <dianders@chromium.org>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: Replacing Link trailers
Message-ID: <20251016-vehement-kittiwake-of-joy-d6db8e@lemur>
References: <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch>
 <2025101448-overtake-mortality-99c8@gregkh>
 <68efd54da845e_2f89910071@dwillia2-mobl4.notmuch>
 <20251015-versed-active-silkworm-bb87bd@lemur>
 <CAHk-=wiLMH5QBF+veebJgdh=e=Q5uz7AEF0sfWPRhSAXvg8ASg@mail.gmail.com>
 <CAHk-=whCgsMuZ8heJ6ma3hCM_reG9+VYWfXorC=14n59TWg22g@mail.gmail.com>
 <2025101631-foyer-wages-8458@gregkh>
 <892a58917795bf5d29394bb5123dae2a6615ca08.camel@HansenPartnership.com>
 <2025101639-thwarting-press-f0f7@gregkh>
 <ef52db7e1d08eb03376fd9343c965aab4dc71ce5.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef52db7e1d08eb03376fd9343c965aab4dc71ce5.camel@HansenPartnership.com>

On Thu, Oct 16, 2025 at 08:29:01AM -0400, James Bottomley wrote:
> > Where exactly would that be added?  Are you suggesting that git add a
> > new atom_type of ATOM_MESSAGEID or something like that?
> 
> Yes, I think so ... just looking at constructing a patch now.
> Regardless of the outcome of this debate it seems like a reasonable
> (and not kernel specific) feature to add to git.

I am wholeheartedly for this approach. One of the downsides of the current
scheme is that Link: trailers can be pointing at multiple patch submissions
(e.g. if the commit wants to highlight a related patch series), so without a
clear indication which link is the provenance link, we still have potential
for confusion.

I recommend that we all stop beating the Link: trailer topic and sit on our
hands until the above is either accepted or rejected by the git maintainers.

IOW:

- Keep current "mindless" Link: approach, with the patch.msgid.link domain for
  automatically-added Link: trailers. It mitigates the problem of Linus
  getting annoyed at the ambiguity, but keeps things working for maintainers
  who are already dependent on these links being present.

- Work with git maintainers to add commit provenance information into the
  commit headers.

- Reconvene at the upcoming maintainer summit to hammer out whatever remains
  of the discussion.


Would that work for everyone?

-K

