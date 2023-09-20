Return-Path: <ksummit+bounces-1178-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A167A7D05
	for <lists@lfdr.de>; Wed, 20 Sep 2023 14:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 061C51C20998
	for <lists@lfdr.de>; Wed, 20 Sep 2023 12:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83AA72E63B;
	Wed, 20 Sep 2023 12:03:42 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252B5154BF
	for <ksummit@lists.linux.dev>; Wed, 20 Sep 2023 12:03:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA5DC433C8;
	Wed, 20 Sep 2023 12:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695211421;
	bh=7ieKnjJEEOXx2PgzL3fNhBeZPLweW3TFIeQSHYWs1sU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i09AnqtGXDvFR0IN2O4I7B8MZRi4XYnJ1w7Fm14nYmaGq2I1+jJVplPXXqNq6f6Cp
	 ZbhfNDYlueofspw/kNJUK1PwU4cDOo/e8bwW/sGMiDuMpyKfXn4+0hvRA9T8vDXlOw
	 uw4RB9PPNbBCHrO/U7jLsLYnXWZW2cCAYKKhD+EUBU4Q0au3CZLxafV9VPDE0+Lx25
	 kCispchXREYUcKm0L+hFMyzD+0FbYZXfTjvCpr6xOB9Ew5fxYKYKh54DGmSHRVrOtA
	 PhmfqVDJPFI4wf+fYbeIGXNLz+pbElmiVUUpmW7Sxna88bjQ9qyQTt0GtMJyVR39hr
	 B9aQhaWIgYEmw==
Date: Wed, 20 Sep 2023 14:03:37 +0200
From: Christian Brauner <brauner@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Theodore Ts'o <tytso@mit.edu>, Shuah <shuah@kernel.org>,
	ksummit@lists.linux.dev,
	tech-board-discuss@lists.linux-foundation.org
Subject: Re: [Tech-board-discuss] [MAINTAINERS SUMMIT] Maintainers Support
 Group
Message-ID: <20230920-klassen-direkt-7a69672536be@brauner>
References: <20230919121001.7bc610d4@gandalf.local.home>
 <371cb5d1-9997-a03b-4848-550ac8658021@kernel.org>
 <ZQoG71Vdy9iLAcY1@mit.edu>
 <20230919170224.17968063@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230919170224.17968063@gandalf.local.home>

> It's like having a family member that is abusing drugs. You go to a support

This is a professional work environment. Such emotionally charged
examples really aren't good analogies.

A support group is a nice idea but only complimentary to the CoC. And
the two should be kept clearly separated.

