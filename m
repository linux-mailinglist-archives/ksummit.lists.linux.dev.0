Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C71A17D72FE
	for <lists@lfdr.de>; Wed, 25 Oct 2023 20:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CCDB1C20D9B
	for <lists@lfdr.de>; Wed, 25 Oct 2023 18:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 404D530FBA;
	Wed, 25 Oct 2023 18:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E49A18B08;
	Wed, 25 Oct 2023 18:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADAFC433C9;
	Wed, 25 Oct 2023 18:10:31 +0000 (UTC)
Date: Wed, 25 Oct 2023 14:10:30 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Jani Nikula <jani.nikula@intel.com>, NeilBrown <neilb@suse.de>,
 Krzysztof Kozlowski  <krzk@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Dan Carpenter <dan.carpenter@linaro.org>,
 ksummit@lists.linux.dev, outreachy@lists.linux.dev,
 kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <20231025141030.63acb006@gandalf.local.home>
In-Reply-To: <893b8cc27684a03865dbf9517a4cbf1bd132950a.camel@HansenPartnership.com>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
	<20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
	<8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org>
	<169818295461.20306.14022136719064683486@noble.neil.brown.name>
	<53c584c21f273548004a7ddb5aa4c04ec7bca1c5.camel@HansenPartnership.com>
	<87fs1y8xkl.fsf@intel.com>
	<893b8cc27684a03865dbf9517a4cbf1bd132950a.camel@HansenPartnership.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 25 Oct 2023 14:07:02 -0400
James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

> Because some MUAs don't have it.  Others are a bit aggressive, meaning
> you have to turn it off anyway if you want to see what's in more than a
> couple of lines of a quote (it only takes me a couple of emails to get
> incredibly annoyed with the way gmail does it, for instance, since it
> never seems to leave enough useful context).

I think this is the key issue. We only want the context of an email that is
being responded to present, and the rest trimmed. Automated trimming or
collapsing doesn't do this well.

Maybe we can make AI do this for us.. hmm

-- Steve

